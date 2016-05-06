class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.integer :user_id_1
      t.integer :order_id
      t.string :action

      t.timestamps null: false
    end
  end
end
