require 'rails_helper'

RSpec.describe "ano_modelos/show", type: :view do
  before(:each) do
    assign(:ano_modelo, AnoModelo.create!(
      modelo: nil,
      referencia_fipe: nil,
      codigo: "Codigo",
      nome: "Nome",
      ano: 2,
      combustivel: "Combustivel",
      combustivel_sigla: "Combustivel Sigla"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Codigo/)
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Combustivel/)
    expect(rendered).to match(/Combustivel Sigla/)
  end
end
