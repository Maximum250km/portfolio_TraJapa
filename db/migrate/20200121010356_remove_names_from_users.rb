class RemoveNamesFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :first_name, :string
    remove_column :users, :last_name, :string
    remove_column :users, :other_name, :string
    remove_column :users, :name, :string
  end
end
