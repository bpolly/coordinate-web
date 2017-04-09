class AddNameToChats < ActiveRecord::Migration[5.0]
  def change
    add_column :chats, :name, :string, null: false
  end
end
