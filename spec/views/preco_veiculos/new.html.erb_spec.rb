require 'rails_helper'

RSpec.describe "preco_veiculos/new", type: :view do
  before(:each) do
    assign(:preco_veiculo, PrecoVeiculo.new(
      ano_modelo: nil,
      referencia_fipe: nil,
      codigo_fipe: "MyString",
      ano_modelo_valor_centavos: 1,
      moeda: "MyString",
      mes_referencia: "MyString",
      tipo_veiculo: 1,
      bruto: ""
    ))
  end

  it "renders new preco_veiculo form" do
    render

    assert_select "form[action=?][method=?]", preco_veiculos_path, "post" do

      assert_select "input[name=?]", "preco_veiculo[ano_modelo_id]"

      assert_select "input[name=?]", "preco_veiculo[referencia_fipe_id]"

      assert_select "input[name=?]", "preco_veiculo[codigo_fipe]"

      assert_select "input[name=?]", "preco_veiculo[ano_modelo_valor_centavos]"

      assert_select "input[name=?]", "preco_veiculo[moeda]"

      assert_select "input[name=?]", "preco_veiculo[mes_referencia]"

      assert_select "input[name=?]", "preco_veiculo[tipo_veiculo]"

      assert_select "input[name=?]", "preco_veiculo[bruto]"
    end
  end
end
