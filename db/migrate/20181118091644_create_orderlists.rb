class CreateOrderlists < ActiveRecord::Migration[5.1]
  def change
    create_table :orderlists do |t|
      t.integer :user_id
      t.integer :restaurant_id
      t.string :description
      t.integer :price
      t.boolean :is_closed

      t.timestamps
    end
  end
end
