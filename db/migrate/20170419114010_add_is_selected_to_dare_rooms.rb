class AddIsSelectedToDareRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :dare_rooms, :isSelected, :boolean
  end
end
