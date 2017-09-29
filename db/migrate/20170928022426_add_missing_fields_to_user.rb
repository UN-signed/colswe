class AddMissingFieldsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :description, :text
    add_column :users, :degree, :text
    add_column :users, :github_username, :string
    add_column :users, :photo, :string
    add_column :users, :departament, :string
  end
end
