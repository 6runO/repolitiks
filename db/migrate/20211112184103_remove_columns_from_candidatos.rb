class RemoveColumnsFromCandidatos < ActiveRecord::Migration[6.0]
  def change
    remove_column :candidatos, :tipo_bem_candidato, :string
    remove_column :candidatos, :valor_bem_candidato, :integer
  end
end
