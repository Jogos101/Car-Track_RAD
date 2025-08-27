require 'rails_helper'

RSpec.describe "marcas/index", type: :view do
  before(:each) do
    assign(:marcas, [
      Marca.create!(
        referencia_fipe: nil,
        codigo: "Codigo",
        nome: "Nome",
        tipo_veiculo: 2
      ),
      Marca.create!(
        referencia_fipe: nil,
        codigo: "Codigo",
        nome: "Nome",
        tipo_veiculo: 2
      )
    ])
  end

  it "renders a list of marcas" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Codigo".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Nome".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end
