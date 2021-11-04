class CreateMarcados < ActiveRecord::Migration[6.0]
  def change
    create_table :marcados do |t|
      t.string :comentario
      t.references :user, null: false, foreign_key: true
      t.references :candidato, null: false, foreign_key: true
      t.boolean :destroyed

      t.timestamps
    end
  end
end
