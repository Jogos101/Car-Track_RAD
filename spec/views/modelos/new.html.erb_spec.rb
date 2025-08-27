require 'rails_helper'

RSpec.describe "modelos/new", type: :view do
  before(:each) do
    assign(:modelo, Modelo.new(
      marca: nil,
      referencia_fipe: nil,
      codigo: "MyString",
      nome: "MyString"
    ))
  end

  it "renders new modelo form" do
    render

    assert_select "form[action=?][method=?]", modelos_path, "post" do

      assert_select "input[name=?]", "modelo[marca_id]"

      assert_select "input[name=?]", "modelo[referencia_fipe_id]"

      assert_select "input[name=?]", "modelo[codigo]"

      assert_select "input[name=?]", "modelo[nome]"
    end
  end
end
