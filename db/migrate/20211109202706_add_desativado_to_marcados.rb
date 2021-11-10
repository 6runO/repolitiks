class AddDesativadoToMarcados < ActiveRecord::Migration[6.0]
  def change
    add_column :marcados, :desativado, :boolean, default: false
  end
end
