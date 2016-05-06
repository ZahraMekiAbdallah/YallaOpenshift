class CreateOrderMembers < ActiveRecord::Migration
  def change
    create_table :order_members do |t|
      t.integer :user_id
      t.integer :order_id
      t.string :joined

      t.timestamps null: false
    end
  end
end
