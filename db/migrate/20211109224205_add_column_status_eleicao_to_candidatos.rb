class AddColumnStatusEleicaoToCandidatos < ActiveRecord::Migration[6.0]
  def change
    add_column :candidatos, :status_eleicao, :string
  end
end
