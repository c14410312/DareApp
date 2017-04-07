class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :userdare_id
      t.integer :vote_up_or_down

      t.timestamps
    end
  end
end
