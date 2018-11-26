class AddQtyToOrderlist < ActiveRecord::Migration[5.1]
  def change
    add_column :orderlists, :quantity, :integer
  end
end
