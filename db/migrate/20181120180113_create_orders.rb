class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :restaurant_id
      t.boolean :is_open
      t.datetime :deadline

      t.timestamps
    end
  end
end
