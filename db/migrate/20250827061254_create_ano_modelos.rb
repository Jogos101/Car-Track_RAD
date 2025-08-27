class CreateAnoModelos < ActiveRecord::Migration[8.0]
  def change
    create_table :ano_modelos do |t|
      t.references :modelo, null: false, foreign_key: true
      t.references :referencia_fipe, null: false, foreign_key: true
      t.string :codigo
      t.string :nome
      t.integer :ano
      t.string :combustivel
      t.string :combustivel_sigla

      t.timestamps
    end
    add_index :ano_modelos, [:modelo_id, :referencia_fipe_id, :codigo], unique: true, name: "idx_anos_modelo_modelo_ref_codigo"
  end
end
