class AddFkToArticle < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :articles, :users
  end
end
