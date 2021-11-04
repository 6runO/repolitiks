class CreateInformacaos < ActiveRecord::Migration[6.0]
  def change
    create_table :informacaos do |t|
      t.string :titulo
      t.text :conteudo
      t.string :fonte
      t.date :data
      t.references :candidato, null: false, foreign_key: true

      t.timestamps
    end
  end
end
