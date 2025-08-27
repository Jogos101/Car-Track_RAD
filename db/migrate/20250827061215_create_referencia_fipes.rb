class CreateReferenciaFipes < ActiveRecord::Migration[8.0]
  def change
    create_table :referencia_fipes do |t|
      t.integer :codigo
      t.string :mes

      t.timestamps
    end
    add_index :referencia_fipes, :codigo, unique: true
  end
end
