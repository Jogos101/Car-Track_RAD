require 'rails_helper'

RSpec.describe "marcas/show", type: :view do
  before(:each) do
    assign(:marca, Marca.create!(
      referencia_fipe: nil,
      codigo: "Codigo",
      nome: "Nome",
      tipo_veiculo: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Codigo/)
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/2/)
  end
end
