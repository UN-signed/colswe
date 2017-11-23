class ChangeTypeOfReseachGroupToMemeber < ActiveRecord::Migration[5.1]
  def change
    change_column :members, :research_group_id, :integer
  end
end
