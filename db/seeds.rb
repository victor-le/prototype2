# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.new
user.username = 'admin'
user.name = 'admin'
user.email = 'admin@mail.com'
user.password = 'password'
user.password_confirmation = 'password'
user.admin = true
user.save!

user2 = User.new
user2.username = 'johndoe22'
user2.name = 'John Doe'
user2.email = 'johndoe22@mail.com'
user2.password = 'password'
user2.password_confirmation = 'password'
user.admin = false
user2.save!

duration = AppDuration.new
duration.duration = 90
duration.durationPrice = 120
duration.save!

duration2 = Appduration.new
duration2.duration = 120
duration2.durationPrice = 150
duration2.save!

service = Service.new
service.serviceName = 'Deep Tissue'
service.servicePrice = 0
service.save!

service2 = Service.new
service2.serviceName = 'Hot Stones'
service2.servicePrice = 10
service2.save!

service3 = Service.new
service3.serviceName = 'Swedish Massage'
service3.servicePrice = 0
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
spec4.requirementDesc = 'Instense'
spec4.requirementValue = 5
spec4.save!
