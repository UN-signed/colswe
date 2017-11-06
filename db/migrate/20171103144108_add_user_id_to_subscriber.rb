class AddUserIdToSubscriber < ActiveRecord::Migration[5.1]
  def change
    add_column :subscribers, :user_id, :int
  end
end
