class AddColumnProjectIdToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :project_id, :int
  end
end
