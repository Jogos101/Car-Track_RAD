require 'rails_helper'

RSpec.describe "ano_modelos/index", type: :view do
  before(:each) do
    assign(:ano_modelos, [
      AnoModelo.create!(
        modelo: nil,
        referencia_fipe: nil,
        codigo: "Codigo",
        nome: "Nome",
        ano: 2,
        combustivel: "Combustivel",
        combustivel_sigla: "Combustivel Sigla"
      ),
      AnoModelo.create!(
        modelo: nil,
        referencia_fipe: nil,
        codigo: "Codigo",
        nome: "Nome",
        ano: 2,
        combustivel: "Combustivel",
        combustivel_sigla: "Combustivel Sigla"
      )
    ])
  end

  it "renders a list of ano_modelos" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Codigo".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Nome".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Combustivel".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Combustivel Sigla".to_s), count: 2
  end
end
