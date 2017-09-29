class CreateResearchLines < ActiveRecord::Migration[5.1]
  def change
    create_table :research_lines do |t|
      t.string :name
      t.text :description
      t.integer :research_area_id

      t.timestamps
    end
  end
end
