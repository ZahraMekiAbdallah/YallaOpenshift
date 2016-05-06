class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
      t.integer :user_id
      t.integer :order_id
      t.string :item
      t.integer :amount
      t.integer :price
      t.text :comment

      t.timestamps null: false
    end
  end
end
