class ReferenciaFipe < ApplicationRecord
  has_many :marcas, dependent: :destroy
  has_many :modelos, dependent: :destroy
  has_many :ano_modelos, dependent: :destroy
  has_many :preco_veiculos, dependent: :destroy
  validates :codigo, presence: true, uniqueness: true
  validates :mes, presence: true
end
