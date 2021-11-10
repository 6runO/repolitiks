class RemoveDestroyedFromMarcados < ActiveRecord::Migration[6.0]
  def change
    remove_column :marcados, :destroyed, :boolean
  end
end
