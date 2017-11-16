class RenameTypeToArticles < ActiveRecord::Migration[5.1]
  def change
    rename_column :articles, :type, :uploader_type
  end
end
