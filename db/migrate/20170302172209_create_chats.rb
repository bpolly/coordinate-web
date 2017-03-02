class CreateChats < ActiveRecord::Migration[5.0]
  def change
    create_table :chats do |t|
      t.references :user, foreign_key: true
      t.point :location
      t.float :distance_limit

      t.timestamps
    end
  end
end
