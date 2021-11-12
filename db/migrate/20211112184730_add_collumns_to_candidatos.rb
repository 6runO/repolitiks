class AddCollumnsToCandidatos < ActiveRecord::Migration[6.0]
  def change
    add_column :candidatos, :sexo, :string
    add_column :candidatos, :sq_candidato, :integer
  end
end
