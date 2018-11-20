class AddMenuPhotoToRestaurant < ActiveRecord::Migration[5.1]
  def change
  	add_attachment :restaurants, :menu_photo
  end
end
