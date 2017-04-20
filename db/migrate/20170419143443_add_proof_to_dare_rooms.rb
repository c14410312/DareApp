class AddProofToDareRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :dare_rooms, :proof, :string
  end
end
