class CreateDareRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :dare_rooms do |t|
      t.string :title
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
