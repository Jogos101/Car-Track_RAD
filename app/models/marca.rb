class Marca < ApplicationRecord
  belongs_to :referencia_fipe
  has_many :modelos, dependent: :destroy

  enum(:tipo_veiculo, { carros: 1, motos: 2, caminhoes: 3 })
  validates :codigo, :nome, :tipo_veiculo, presence: true
end
