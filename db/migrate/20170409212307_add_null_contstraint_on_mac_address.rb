class AddNullContstraintOnMacAddress < ActiveRecord::Migration[5.0]
  def change
    change_column_null :users, :mac_address, false
  end
end
