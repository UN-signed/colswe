class ChangeResearchGroupIdInUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :Users, :research_group_id, :integer, :default => 0
  end
end
