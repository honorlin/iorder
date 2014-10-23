class AddMenuImageToShops < ActiveRecord::Migration
  def change
  	add_attachment :shops, :menu_image
  end
end
