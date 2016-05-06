class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :order_for
      t.string :status
      t.string :resturant
      t.string :menu_image

      t.timestamps null: false
    end
  end
end
