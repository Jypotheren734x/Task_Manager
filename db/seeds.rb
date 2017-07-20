# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
password = "toor"
for i in 0...100 do
  user = User.create(first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              email: Faker::Internet.email,
              password: password,
              birthday: Faker::Date.birthday,
              username: Faker::FunnyName.name
  )
  user.update_attributes(confimed_at: Time.now)
  p user.to_a
end