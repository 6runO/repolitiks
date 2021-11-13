class ChangeSqCandidatoOnCandidatos < ActiveRecord::Migration[6.0]
  def change
    change_column :candidatos, :sq_candidato, :string
  end
end
