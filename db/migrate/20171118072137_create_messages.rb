class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.integer :from_id
      t.integer :to_id
      t.string :subject
      t.text :message

      t.timestamps
    end
  end
end
