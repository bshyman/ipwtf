# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Environment variables (ENV['...']) can be set in the file .env file.

User.create!(first_name: 'System', last_name: 'System', name: 'System', email: 'bshyman@gmail.com')