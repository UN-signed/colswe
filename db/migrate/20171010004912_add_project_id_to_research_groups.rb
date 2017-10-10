class AddProjectIdToResearchGroups < ActiveRecord::Migration[5.1]
  def change
    add_column :research_groups, :project_id, :integer
  end
end
