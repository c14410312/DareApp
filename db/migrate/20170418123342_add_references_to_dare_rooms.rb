class AddReferencesToDareRooms < ActiveRecord::Migration[5.0]
  def change
  	add_reference :dare_rooms, :sent_to, index:true
  	add_reference :dare_rooms, :sent_from, index:true
  end
end
