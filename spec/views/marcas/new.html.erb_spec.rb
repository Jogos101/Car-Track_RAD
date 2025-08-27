require 'rails_helper'

RSpec.describe "marcas/new", type: :view do
  before(:each) do
    assign(:marca, Marca.new(
      referencia_fipe: nil,
      codigo: "MyString",
      nome: "MyString",
      tipo_veiculo: 1
    ))
  end

  it "renders new marca form" do
    render

    assert_select "form[action=?][method=?]", marcas_path, "post" do

      assert_select "input[name=?]", "marca[referencia_fipe_id]"

      assert_select "input[name=?]", "marca[codigo]"

      assert_select "input[name=?]", "marca[nome]"

      assert_select "input[name=?]", "marca[tipo_veiculo]"
    end
  end
end
