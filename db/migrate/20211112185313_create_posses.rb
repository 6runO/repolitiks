class CreatePosses < ActiveRecord::Migration[6.0]
  def change
    create_table :posses do |t|
      t.string :tipo
      t.float :valor
      t.references :candidato, null: false, foreign_key: true

      t.timestamps
    end
  end
end
