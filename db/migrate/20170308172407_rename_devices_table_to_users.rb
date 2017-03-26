class RenameDevicesTableToUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :chats, :user_id
    remove_column :devices, :user_id
    drop_table :users
    rename_table :devices, :users
    add_reference :chats, :user, index: true
    add_foreign_key :chats, :users
  end
end
