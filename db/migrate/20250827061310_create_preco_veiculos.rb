class CreatePrecoVeiculos < ActiveRecord::Migration[8.0]
  def change
    create_table :preco_veiculos do |t|
      t.references :ano_modelo, null: false, foreign_key: true
      t.references :referencia_fipe, null: false, foreign_key: true
      t.string :codigo_fipe
      t.integer :ano_modelo_valor_centavos
      t.string :moeda
      t.string :mes_referencia
      t.integer :tipo_veiculo
      t.jsonb :bruto
      t.datetime :atualizado_em

      t.timestamps
    end
    add_index :preco_veiculos, [:ano_modelo_id, :referencia_fipe_id], unique: true, name: "idx_preco_veiculo_unico"
    add_index :preco_veiculos, :codigo_fipe
  end
end
