require 'rails_helper'

RSpec.describe "referencia_fipes/new", type: :view do
  before(:each) do
    assign(:referencia_fipe, ReferenciaFipe.new(
      codigo: 1,
      mes: "MyString"
    ))
  end

  it "renders new referencia_fipe form" do
    render

    assert_select "form[action=?][method=?]", referencia_fipes_path, "post" do

      assert_select "input[name=?]", "referencia_fipe[codigo]"

      assert_select "input[name=?]", "referencia_fipe[mes]"
    end
  end
end
