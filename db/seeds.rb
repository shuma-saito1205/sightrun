# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = Admin.find_or_create_by!(email: "admin@example.com") do |admin|
  admin.password = "password"
  admin.password_confirmation = "password"
end

# shuma = User.find_or_create_by!(email: "shuma@gmail.com") do |user|
#   user.name = "shuma"
#   user.password = "shuma11"
#   user.password_confirmation = "shuma11"
# end

# saito = User.find_or_create_by!(email: "saito@gmail.com") do |user|
#   user.name = "saito"
#   user.password = "saito11"
#   user.password_confirmation = "saito11"
# end
