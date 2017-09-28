class CreateResearchGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :research_groups do |t|
      t.string :name
      t.text :description
      t.integer :administrator_id, default: 0, null: false

      t.timestamps
    end
  end
end
