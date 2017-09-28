class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :name
      t.text :key_words
      t.text :description
      t.string :lenguage
      t.text :bibliography
      t.string :file_path
      t.timestamps
    end
  end
end
