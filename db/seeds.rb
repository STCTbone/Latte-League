# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [
  {first_name: "Will", last_name: "Piers",  email: "wpiers@gmail.com"},
  {first_name: "Ankur", last_name: "Patel", email: "emailankur@gmail.com"},
  {first_name: "Pedro", last_name: "Carmo",  email: "drocarmo@gmail.com"},
  {first_name: "Matt", last_name: "Rieger",  email: "mattrieger@gmail.com"},
  {first_name: "Gareth", last_name: "Burrows",  email: "gburrows@gmail.com"},
  {first_name: "Alex", last_name: "Storm",  email: "alexstorm@gmail.com"},
  {first_name: "John", last_name: "Smith",  email: "jsmith2@gmail.com"}
]

User.destroy_all
users.each do |user_hash|
  u = User.new
  u.first_name = user_hash[:first_name]
  u.last_name = user_hash[:last_name]
  u.email = user_hash[:email]
  u.password = "1"
  u.is_vendor = true
  u.mobile = ['0','1','2','3','4','5','6','7','8','9'].shuffle.join
  u.save
end

u = User.new({ first_name: "user",last_name: "joe", email: "joe@gmail.com", password: "password", mobile: "1234567891", is_vendor: false})
u.save

names = [ "Kangocho", "Zirikana", "Tres Santos", "Black Cat", "Organic Earl Grey", "Summer Satrupa Assam", "Organic Emerald Spring", "Organic Kagoshima Shincha", "Organic Green Needles", "Organic White Peony", "Chai", "Espresso", "Cappucinno", "Macchiato", "Mocha", "Angelino", "Green", "Latte", "Espresso"]

country = ["USA"]

city = ["Los Angeles", "Chicago", "Seattle", "Portland", "Sacramento", "Napa", "Philadelphia", "Botswana USA"]

category = ["Tea", "Coffee"]

is_available = ["true", "false"]

Category.destroy_all
20.times do
  c = Category.new
  c.name = category.sample
  c.save
end

Item.destroy_all
30.times do
  i = Item.new
  i.price = ['0','1', '2', '3'].shuffle.join
  i.name = names.sample
  i.country = country.sample
  i.city = city.sample
  i.category_id = Category.all.shuffle.first.id
  i.is_available = true
  i.save
end

status = ["Submitted", "Complete", "Requested"]

Order.destroy_all
20.times do
  o = Order.new
  o.user_id = User.all.shuffle.first.id
  o.total_price = ['0','1', '2', '3'].shuffle.join
  o.status = status.sample
  o.save
end
