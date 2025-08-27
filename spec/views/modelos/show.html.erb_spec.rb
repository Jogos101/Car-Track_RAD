require 'rails_helper'

RSpec.describe "modelos/show", type: :view do
  before(:each) do
    assign(:modelo, Modelo.create!(
      marca: nil,
      referencia_fipe: nil,
      codigo: "Codigo",
      nome: "Nome"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Codigo/)
    expect(rendered).to match(/Nome/)
  end
end
