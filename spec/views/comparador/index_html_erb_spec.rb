require "rails_helper"

RSpec.describe "comparador/index", type: :view do
  MarcaStub = Struct.new(:codigo, :nome)

  context "sem veículos selecionados" do
    it "mostra os 2 formulários de busca com selects e botões" do
      assign(:marcas, [MarcaStub.new("21", "Fiat"), MarcaStub.new("23", "Toyota")])
      assign(:condiction1, false)
      assign(:condiction2, false)
      assign(:veiculo1, nil)
      assign(:veiculo2, nil)

      render

      # Card 1
      expect(rendered).to have_selector("form input[name='card'][value='1']", count: 1)
      expect(rendered).to have_selector("select#marca1")
      expect(rendered).to have_selector("select#modelo1")
      expect(rendered).to have_selector("select#ano1")
      # Card 2
      expect(rendered).to have_selector("form input[name='card'][value='2']", count: 1)
      expect(rendered).to have_selector("select#marca2")
      expect(rendered).to have_selector("select#modelo2")
      expect(rendered).to have_selector("select#ano2")

      # Canvas do gráfico
      expect(rendered).to have_selector("#graficoComparador")
    end
  end

  context "com um veículo selecionado" do
    it "renderiza o card selecionado e preserva hidden fields do outro" do
      assign(:marcas, [MarcaStub.new("21", "Fiat")])
      assign(:condiction1, true)
      assign(:veiculo1, {
        modelo_codigo: "5001",
        modelo_nome: "Fiat - Argo",
        ano: 2022,
        combustivel: "Flex",
        valor: 75000.0
      })
      assign(:condiction2, false)
      assign(:veiculo2, nil)

      render

      expect(rendered).to include("Fiat - Argo")
      expect(rendered).to have_content("Ano:")
      expect(rendered).to have_content("Combustível:")

      # Form do Card 2 deve conter hidden fields preservando o card 1 (se você os incluiu)
      expect(rendered).to have_selector("input[type='hidden'][name='codigoModelo'][value='5001']", count: 1)
      expect(rendered).to have_selector("input[type='hidden'][name='codigoAno'][value='2022']", count: 1)
    end
  end
end
