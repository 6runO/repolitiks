class AddNomeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nome, :string
  end
end
