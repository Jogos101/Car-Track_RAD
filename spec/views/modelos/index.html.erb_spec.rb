require 'rails_helper'

RSpec.describe "modelos/index", type: :view do
  before(:each) do
    assign(:modelos, [
      Modelo.create!(
        marca: nil,
        referencia_fipe: nil,
        codigo: "Codigo",
        nome: "Nome"
      ),
      Modelo.create!(
        marca: nil,
        referencia_fipe: nil,
        codigo: "Codigo",
        nome: "Nome"
      )
    ])
  end

  it "renders a list of modelos" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Codigo".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Nome".to_s), count: 2
  end
end
