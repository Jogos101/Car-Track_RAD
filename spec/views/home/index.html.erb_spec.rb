require "rails_helper"

RSpec.describe "home/index", type: :view do
  MarcaStub = Struct.new(:codigo, :nome)

  it "renderiza selects de marcas e modelos e containers de tabela e gráfico" do
    assign(:marcas, [
      MarcaStub.new("21", "Fiat"),
      MarcaStub.new("22", "Ford")
    ])

    render

    expect(rendered).to have_selector("select#marcas")
    expect(rendered).to have_selector("select#modelos")
    expect(rendered).to have_selector("#tabela-veiculos-card")
    expect(rendered).to have_selector("#grafico-veiculos-card")
    expect(rendered).to have_selector("#graficoAnoPreco")
  end
end
