require 'rails_helper'

RSpec.describe "marcas/edit", type: :view do
  let(:marca) {
    Marca.create!(
      referencia_fipe: nil,
      codigo: "MyString",
      nome: "MyString",
      tipo_veiculo: 1
    )
  }

  before(:each) do
    assign(:marca, marca)
  end

  it "renders the edit marca form" do
    render

    assert_select "form[action=?][method=?]", marca_path(marca), "post" do

      assert_select "input[name=?]", "marca[referencia_fipe_id]"

      assert_select "input[name=?]", "marca[codigo]"

      assert_select "input[name=?]", "marca[nome]"

      assert_select "input[name=?]", "marca[tipo_veiculo]"
    end
  end
end
