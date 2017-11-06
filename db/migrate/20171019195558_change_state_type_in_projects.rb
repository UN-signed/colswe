class ChangeStateTypeInProjects < ActiveRecord::Migration[5.1]
  def change
    change_column :projects, :state, :string    
  end
end
