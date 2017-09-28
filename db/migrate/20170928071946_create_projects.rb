class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.boolean :state
      t.text :summary
      t.string :git
      t.integer :research_group_id

      t.timestamps
    end
  end
end
