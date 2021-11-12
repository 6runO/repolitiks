class AddSqCandidatoToPosses < ActiveRecord::Migration[6.0]
  def change
    add_column :posses, :sq_candidato, :string
  end
end
