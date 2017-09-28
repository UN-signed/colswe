class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.string :role
      t.integer :user_id
      t.integer :project_id
      t.string :research_group_id

      t.timestamps
    end
  end
end
