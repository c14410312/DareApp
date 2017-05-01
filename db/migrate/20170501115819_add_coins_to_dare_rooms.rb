class AddCoinsToDareRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :dare_rooms, :coins, :integer
  end
end
