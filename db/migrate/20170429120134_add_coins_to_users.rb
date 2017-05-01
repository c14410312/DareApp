class AddCoinsToUsers < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :coins
  	add_column :users, :coins, :integer, :default=>100
  end
end
