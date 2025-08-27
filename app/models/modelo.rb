class Modelo < ApplicationRecord
  belongs_to :marca
  belongs_to :referencia_fipe
  has_many :ano_modelos, dependent: :destroy
  validates :codigo, :nome, presence: true
end
