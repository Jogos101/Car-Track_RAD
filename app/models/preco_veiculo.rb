class PrecoVeiculo < ApplicationRecord
  belongs_to :ano_modelo
  belongs_to :referencia_fipe
  validates :codigo_fipe, presence: true
end
