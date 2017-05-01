class AddMakeProofPublicToDareRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :dare_rooms, :publish_proof, :boolean
  end
end
