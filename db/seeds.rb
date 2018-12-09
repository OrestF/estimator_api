# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
FactoryBot.create(:admin, email: 'admin@mail.com', password: 'admin_password')
manager = FactoryBot.create(:manager, email: 'manager@mail.com', password: 'manager_password')
FactoryBot.create(:worker, organization: manager.organization, email: 'worker@mail.com', password: 'manager_password')
