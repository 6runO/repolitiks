class CreateCandidatos < ActiveRecord::Migration[6.0]
  def change
    create_table :candidatos do |t|
      t.string :cpf
      t.string :nome_candidato
      t.string :email
      t.date :nascimento
      t.string :grau_instrucao
      t.string :ocupacao
      t.string :partido
      t.string :cargo
      t.string :estado
      t.string :nome_urna
      t.integer :ano_eleicao
      t.boolean :eleito

      t.timestamps
    end
  end
end
