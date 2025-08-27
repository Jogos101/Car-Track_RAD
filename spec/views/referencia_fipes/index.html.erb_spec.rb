require 'rails_helper'

RSpec.describe "referencia_fipes/index", type: :view do
  before(:each) do
    assign(:referencia_fipes, [
      ReferenciaFipe.create!(
        codigo: 2,
        mes: "Mes"
      ),
      ReferenciaFipe.create!(
        codigo: 2,
        mes: "Mes"
      )
    ])
  end

  it "renders a list of referencia_fipes" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Mes".to_s), count: 2
  end
end
