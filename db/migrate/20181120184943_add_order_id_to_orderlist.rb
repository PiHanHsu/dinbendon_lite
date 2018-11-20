class AddOrderIdToOrderlist < ActiveRecord::Migration[5.1]
  def change
  	add_column :orderlists, :order_id, :integer
  end
end
