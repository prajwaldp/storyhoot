class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.string :message
      t.string :link

      t.timestamps
    end
  end
end