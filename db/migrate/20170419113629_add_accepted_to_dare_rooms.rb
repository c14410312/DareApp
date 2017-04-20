class AddAcceptedToDareRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :dare_rooms, :accepted, :boolean
  end
end
