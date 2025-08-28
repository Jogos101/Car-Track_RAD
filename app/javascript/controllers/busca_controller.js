import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [
    "marcas", "modelos",
    "tableCard", "tableBody",
    "graficoCard", "canvas",
    "trend"
  ]

  static values = {
    modelosUrlTemplate: String, // "/marcas/:marca/modelos"
    precosUrlTemplate:  String  // "/veiculos_modelo/:modelo"
  }

  connect() {
    this.chart = null
    this.disable(this.modelosTarget)
    this.hide(this.tableCardTarget)
    this.hide(this.graficoCardTarget)
  }

  // Marca mudou → carrega modelos
  async marcaChanged() {
    const codigo = this.marcasTarget.value
    this.resetSelect(this.modelosTarget, "-- Selecione um modelo --")
    this.disable(this.modelosTarget)
    this.clearTableAndChart()

    if (codigo === "0" || !codigo) return

    const url = this.modelosUrlTemplateValue.replace(":marca", encodeURIComponent(codigo))
    const modelos = await this.safeJson(url)

    if (!Array.isArray(modelos) || modelos.length === 0) return

    for (const m of modelos) {
      const opt = document.createElement("option")
      opt.value = m.codigo
      opt.textContent = m.nome
      this.modelosTarget.appendChild(opt)
    }
    this.enable(this.modelosTarget)
  }

  // Botão “Buscar”
  async buscar() {
    const marca  = this.marcasTarget.value
    const modelo = this.modelosTarget.value

    if (marca === "0" || modelo === "0") {
      this.hide(this.tableCardTarget)
      this.hide(this.graficoCardTarget)
      return
    }

    const url = this.precosUrlTemplateValue.replace(":modelo", encodeURIComponent(modelo))
    const data = await this.safeJson(url)

    // Tabela
    this.tableBodyTarget.innerHTML = ""
    const anos = []
    const precos = []

    for (const v of data) {
      const tr = document.createElement("tr")
      const valorFormatado = Number(v.valor || 0).toLocaleString("pt-BR", { style: "currency", currency: "BRL" })
      tr.innerHTML = `
        <td>${v.codigoFipe ?? ""}</td>
        <td>${v.modelo?.nome ?? ""} - ${v.ano ?? ""}</td>
        <td>${valorFormatado}</td>
        <td>${v.combustivel ?? ""}</td>
      `
      this.tableBodyTarget.appendChild(tr)
      if (v.ano != null)   anos.push(v.ano)
      if (v.valor != null) precos.push(v.valor)
    }

    if (data.length === 0) {
      this.hide(this.tableCardTarget)
      this.hide(this.graficoCardTarget)
      return
    }

    this.show(this.tableCardTarget)
    this.show(this.graficoCardTarget)

    // Gráfico
    this.renderChart(anos, precos)
    this.updateTrend(precos.slice().reverse())
  }

  // ===== helpers =====
  renderChart(anos, precos) {
    if (!this.canvasTarget) return
    if (this.chart) { this.chart.destroy(); this.chart = null }

    const ctx = this.canvasTarget.getContext("2d")
    this.chart = new Chart(ctx, {
      type: "line",
      data: {
        labels: anos,
        datasets: [{
          label: "Preço (R$)",
          data: precos,
          fill: false,
          tension: 0.2
        }]
      },
      options: { responsive: true, scales: { y: { beginAtZero: false } } }
    })
  }

  updateTrend(valoresReverso) {
    if (!this.trendTarget) return
    if (valoresReverso.length < 2) {
      this.trendTarget.className = "badge rounded-pill fw-normal"
      this.trendTarget.textContent = ""
      return
    }

    const atual    = valoresReverso[valoresReverso.length - 2]
    const anterior = valoresReverso[valoresReverso.length - 1]
    const diff = atual - anterior
    const perc = anterior ? (diff / anterior) * 100 : 0

    this.trendTarget.className = "badge rounded-pill fw-normal"
    this.trendTarget.classList.remove("bg-success","bg-danger","bg-secondary")
    this.trendTarget.innerHTML = ""

    const i = document.createElement("i")
    i.classList.add("me-1","fas")

    if (diff > 0) { this.trendTarget.classList.add("bg-success"); i.classList.add("fa-arrow-up") }
    else if (diff < 0) { this.trendTarget.classList.add("bg-danger"); i.classList.add("fa-arrow-down") }
    else { this.trendTarget.classList.add("bg-secondary"); i.classList.add("fa-minus") }

    this.trendTarget.appendChild(i)
    this.trendTarget.append(`${diff > 0 ? "+" : ""}${perc.toFixed(1)}%`)
  }

  async safeJson(url) {
    try {
      const r = await fetch(url, { headers: { "Accept": "application/json" } })
      if (!r.ok) return []
      return await r.json().catch(() => [])
    } catch { return [] }
  }

  resetSelect(el, placeholder) {
    el.innerHTML = ""
    const opt = document.createElement("option")
    opt.value = "0"; opt.selected = true; opt.textContent = placeholder
    el.appendChild(opt)
  }

  disable(el){ el.disabled = true }
  enable(el){ el.disabled = false }
  show(el){ el.style.display = "block" }
  hide(el){ el.style.display = "none" }

  clearTableAndChart() {
    this.tableBodyTarget.innerHTML = ""
    this.hide(this.tableCardTarget)
    this.hide(this.graficoCardTarget)
    if (this.chart) { this.chart.destroy(); this.chart = null }
    if (this.trendTarget) { this.trendTarget.className = "badge rounded-pill fw-normal"; this.trendTarget.innerHTML = "" }
  }
}
