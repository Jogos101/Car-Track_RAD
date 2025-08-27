require 'rails_helper'

RSpec.describe "preco_veiculos/index", type: :view do
  before(:each) do
    assign(:preco_veiculos, [
      PrecoVeiculo.create!(
        ano_modelo: nil,
        referencia_fipe: nil,
        codigo_fipe: "Codigo Fipe",
        ano_modelo_valor_centavos: 2,
        moeda: "Moeda",
        mes_referencia: "Mes Referencia",
        tipo_veiculo: 3,
        bruto: ""
      ),
      PrecoVeiculo.create!(
        ano_modelo: nil,
        referencia_fipe: nil,
        codigo_fipe: "Codigo Fipe",
        ano_modelo_valor_centavos: 2,
        moeda: "Moeda",
        mes_referencia: "Mes Referencia",
        tipo_veiculo: 3,
        bruto: ""
      )
    ])
  end

  it "renders a list of preco_veiculos" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Codigo Fipe".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Moeda".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Mes Referencia".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("".to_s), count: 2
  end
end
