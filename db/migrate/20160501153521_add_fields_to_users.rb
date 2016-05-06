class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :secondName, :string
    add_column :users, :phoneNumber, :integer
  end
end
