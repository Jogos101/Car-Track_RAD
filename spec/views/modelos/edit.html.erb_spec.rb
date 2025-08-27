require 'rails_helper'

RSpec.describe "modelos/edit", type: :view do
  let(:modelo) {
    Modelo.create!(
      marca: nil,
      referencia_fipe: nil,
      codigo: "MyString",
      nome: "MyString"
    )
  }

  before(:each) do
    assign(:modelo, modelo)
  end

  it "renders the edit modelo form" do
    render

    assert_select "form[action=?][method=?]", modelo_path(modelo), "post" do

      assert_select "input[name=?]", "modelo[marca_id]"

      assert_select "input[name=?]", "modelo[referencia_fipe_id]"

      assert_select "input[name=?]", "modelo[codigo]"

      assert_select "input[name=?]", "modelo[nome]"
    end
  end
end
