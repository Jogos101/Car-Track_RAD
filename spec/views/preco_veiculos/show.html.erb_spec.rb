require 'rails_helper'

RSpec.describe "preco_veiculos/show", type: :view do
  before(:each) do
    assign(:preco_veiculo, PrecoVeiculo.create!(
      ano_modelo: nil,
      referencia_fipe: nil,
      codigo_fipe: "Codigo Fipe",
      ano_modelo_valor_centavos: 2,
      moeda: "Moeda",
      mes_referencia: "Mes Referencia",
      tipo_veiculo: 3,
      bruto: ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Codigo Fipe/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Moeda/)
    expect(rendered).to match(/Mes Referencia/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(//)
  end
end
