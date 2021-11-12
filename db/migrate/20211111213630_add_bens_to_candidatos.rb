class AddBensToCandidatos < ActiveRecord::Migration[6.0]
  def change
    add_column :candidatos, :tipo_bem_candidato, :string
    add_column :candidatos, :valor_bem_candidato, :integer
  end
end
