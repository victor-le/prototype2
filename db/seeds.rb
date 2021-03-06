# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.new
user.name = 'admin'
user.email = 'admin@mail.com'
user.password = 'password'
user.password_confirmation = 'password'
user.admin = true
user.phone_number = '713-172-5555'
user.save(false)

user2 = User.new
user2.name = 'John Doe'
user2.email = 'johndoe22@mail.com'
user2.password = 'password'
user2.password_confirmation = 'password'
user.admin = false
user.phone_number = '832-797-8172'
user2.save(false)

user3 = User.new
user.name = 'Anna Alegria'
user.email = 'handsoflyfe@gmail.com'
user.password = 'Lovemassage2018'
user.password_confirmation = 'Lovemassage2018'
user.admin = true
user.phone_number = '832-890-9086'
user.save(false)

user4 = User.new
user.name = 'Wendy Nguyen'
user.email = 'wendynguyen312@outlook.com'
user.password = 'studentdebt19!'
user.password_confirmation = 'password'
user.admin = true
user.phone_number = '713-272-1728'
user.save(false)

duration = AppDuration.new
duration.duration = 90
duration.durationPrice = 120
duration.save!

duration2 = AppDuration.new
duration2.duration = 120
duration2.durationPrice = 150
duration2.save!

service = Service.new
service.serviceName = 'Deep Tissue'
service.servicePrice = 15
service.save!

service2 = Service.new
service2.serviceName = 'Hot Stones'
service2.servicePrice = 10
service2.save!

service3 = Service.new
service3.serviceName = 'Swedish Massage'
service3.servicePrice = 20
service3.save!

service4 = Service.new
service4.serviceName = 'Cupping Therapy'
service4.servicePrice = 15
service4.save!

spec = SpecialRequirement.new
spec.requirementDesc = 'Relaxed'
spec.requirementValue = 1
spec.save!

spec2 = SpecialRequirement.new
spec2.requirementDesc = 'Light'
spec2.requirementValue = 2
spec2.save!

spec3 = SpecialRequirement.new
spec3.requirementDesc = 'Medium'
spec3.requirementValue = 3
spec3.save!

spec3 = SpecialRequirement.new
spec3.requirementDesc = 'Moderate'
spec3.requirementValue = 4
spec3.save!

spec4 = SpecialRequirement.new
spec4.requirementDesc = 'Intense'
spec4.requirementValue = 5
spec4.save!
