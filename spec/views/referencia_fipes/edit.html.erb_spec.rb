require 'rails_helper'

RSpec.describe "referencia_fipes/edit", type: :view do
  let(:referencia_fipe) {
    ReferenciaFipe.create!(
      codigo: 1,
      mes: "MyString"
    )
  }

  before(:each) do
    assign(:referencia_fipe, referencia_fipe)
  end

  it "renders the edit referencia_fipe form" do
    render

    assert_select "form[action=?][method=?]", referencia_fipe_path(referencia_fipe), "post" do

      assert_select "input[name=?]", "referencia_fipe[codigo]"

      assert_select "input[name=?]", "referencia_fipe[mes]"
    end
  end
end
