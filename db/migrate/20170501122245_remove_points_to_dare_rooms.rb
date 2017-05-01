class RemovePointsToDareRooms < ActiveRecord::Migration[5.0]
  def change
    remove_column :dare_rooms, :points, :integer
  end
end
