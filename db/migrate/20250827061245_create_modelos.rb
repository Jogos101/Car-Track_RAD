class CreateModelos < ActiveRecord::Migration[8.0]
  def change
    create_table :modelos do |t|
      t.references :marca, null: false, foreign_key: true
      t.references :referencia_fipe, null: false, foreign_key: true
      t.string :codigo
      t.string :nome

      t.timestamps
    end
    add_index :modelos, [:marca_id, :referencia_fipe_id, :codigo], unique: true, name: "idx_modelos_marca_ref_codigo"
  end
end
