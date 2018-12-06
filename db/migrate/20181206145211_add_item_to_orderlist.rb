class AddItemToOrderlist < ActiveRecord::Migration[5.1]
  def change
  	add_column :orderlists, :item, :string
  end
end
