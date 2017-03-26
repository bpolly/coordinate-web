class AddLatitudeAndLongitudeToChat < ActiveRecord::Migration[5.0]
  def change
    add_column :chats, :latitude, :float
    add_column :chats, :longitude, :float
    remove_column :chats, :location
  end
end
