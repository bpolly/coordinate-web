class AddUserToMessages < ActiveRecord::Migration[5.0]
  def change
    add_reference :messages, :user, index: true
    add_foreign_key :messages, :users
  end
end
