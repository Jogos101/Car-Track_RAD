class AnoModelo < ApplicationRecord
  belongs_to :modelo
  belongs_to :referencia_fipe
  has_one :preco_veiculo, dependent: :destroy
  validates :codigo, :nome, presence: true
end