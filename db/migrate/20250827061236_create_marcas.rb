class CreateMarcas < ActiveRecord::Migration[8.0]
  def change
    create_table :marcas do |t|
      t.references :referencia_fipe, null: false, foreign_key: true
      t.string :codigo
      t.string :nome
      t.integer :tipo_veiculo

      t.timestamps
    end
    add_index :marcas, [:referencia_fipe_id, :tipo_veiculo, :codigo], unique: true, name: "idx_marcas_ref_tipo_codigo"
  end
end
