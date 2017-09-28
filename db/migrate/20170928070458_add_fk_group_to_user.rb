class AddFkGroupToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :research_group_id, :integer
  end
end
