require 'rails_helper'

RSpec.describe "ano_modelos/new", type: :view do
  before(:each) do
    assign(:ano_modelo, AnoModelo.new(
      modelo: nil,
      referencia_fipe: nil,
      codigo: "MyString",
      nome: "MyString",
      ano: 1,
      combustivel: "MyString",
      combustivel_sigla: "MyString"
    ))
  end

  it "renders new ano_modelo form" do
    render

    assert_select "form[action=?][method=?]", ano_modelos_path, "post" do

      assert_select "input[name=?]", "ano_modelo[modelo_id]"

      assert_select "input[name=?]", "ano_modelo[referencia_fipe_id]"

      assert_select "input[name=?]", "ano_modelo[codigo]"

      assert_select "input[name=?]", "ano_modelo[nome]"

      assert_select "input[name=?]", "ano_modelo[ano]"

      assert_select "input[name=?]", "ano_modelo[combustivel]"

      assert_select "input[name=?]", "ano_modelo[combustivel_sigla]"
    end
  end
end
