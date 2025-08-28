import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["marca", "modelo", "ano", "submit"]
  static values  = {
    modelosUrlTemplate: String, // ex: "/marcas/:marca/modelos"
    anosUrlTemplate: String     // ex: "/modelos/:modelo/anos"
  }

  connect() {
    // estado inicial
    this.disable(this.modeloTarget)
    this.disable(this.anoTarget)
    this.disable(this.submitTarget)
  }

  // chamado no change do select de marca
  async marcaChanged() {
    const marcaCodigo = this.marcaTarget.value
    this.resetSelect(this.modeloTarget, "-- Selecione um modelo --")
    this.resetSelect(this.anoTarget, "-- Selecione um ano --")
    this.disable(this.submitTarget)

    if (marcaCodigo === "0" || !marcaCodigo) {
      this.disable(this.modeloTarget)
      this.disable(this.anoTarget)
      return
    }

    // /marcas/:marca/modelos
    const url = this.modelosUrlTemplateValue.replace(":marca", encodeURIComponent(marcaCodigo))
    const modelos = await this.safeJson(url)

    if (!Array.isArray(modelos)) {
      this.disable(this.modeloTarget)
      this.disable(this.anoTarget)
      return
    }

    for (const m of modelos) {
      const opt = document.createElement("option")
      opt.value = m.codigo
      opt.textContent = m.nome
      this.modeloTarget.appendChild(opt)
    }

    this.enable(this.modeloTarget)
    this.disable(this.anoTarget)
  }

  // chamado no change do select de modelo
  async modeloChanged() {
    const modeloCodigo = this.modeloTarget.value
    this.resetSelect(this.anoTarget, "-- Selecione um ano --")
    this.disable(this.submitTarget)

    if (modeloCodigo === "0" || !modeloCodigo) {
      this.disable(this.anoTarget)
      return
    }

    // /modelos/:modelo/anos
    const url = this.anosUrlTemplateValue.replace(":modelo", encodeURIComponent(modeloCodigo))
    const anos = await this.safeJson(url)

    if (!Array.isArray(anos) || anos.length === 0) {
      this.disable(this.anoTarget)
      return
    }

    for (const ano of anos) {
      const opt = document.createElement("option")
      opt.value = ano
      opt.textContent = ano
      this.anoTarget.appendChild(opt)
    }

    this.enable(this.anoTarget)
  }

  // chamado no change do select de ano
  anoChanged() {
    const ok = (this.marcaTarget.value !== "0" && this.modeloTarget.value !== "0" && this.anoTarget.value !== "0")
    this.submitTarget.disabled = !ok
  }

  // utilitários
  disable(el) { el.disabled = true }
  enable(el)  { el.disabled = false }
  resetSelect(el, placeholder) {
    el.innerHTML = ""
    const opt = document.createElement("option")
    opt.value = "0"
    opt.selected = true
    opt.textContent = placeholder
    el.appendChild(opt)
  }

  async safeJson(url) {
    try {
      const r = await fetch(url, { headers: { "Accept": "application/json" } })
      if (!r.ok) return []
      return await r.json().catch(() => [])
    } catch {
      return []
    }
  }
}
