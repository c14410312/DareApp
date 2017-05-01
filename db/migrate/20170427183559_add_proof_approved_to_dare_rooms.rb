class AddProofApprovedToDareRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :dare_rooms, :proof_approved, :boolean
  end
end
