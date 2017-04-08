# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!({:email => "jojo@gmail.com", :password => "11111111", :password_confirmation => "11111111"})
Userdare.create!({:name => "Dance around to the Irish National Anthem on Grafton street", :user_id => 1})