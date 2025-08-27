require 'rails_helper'

RSpec.describe "referencia_fipes/show", type: :view do
  before(:each) do
    assign(:referencia_fipe, ReferenciaFipe.create!(
      codigo: 2,
      mes: "Mes"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Mes/)
  end
end
