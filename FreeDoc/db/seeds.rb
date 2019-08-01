require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Patient.destroy_all
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'patients'")
Doctor.destroy_all
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'doctors'")
Appointment.destroy_all
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'appointments'")
City.destroy_all
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'cities'")
Specialty.destroy_all
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'specialties'")
DoctorSpecialty.destroy_all
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'doctor_specialties'")


City.create(name: "Paris")
City.create(name: "Bordeaux")
City.create(name: "Caen")

5.times do |x|
  Specialty.create(name: Faker::Job.title)
  p "Specialité #{x} créé"
end

10.times do |x|
  Doctor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,speciality: Faker::name.speciality zip_code: Faker::Number.zip_code)
end 
10.times do |x|
  Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.first_name, city_id: rand(1..x))
end 
10.times do |x|  
  Appointment.create(doctor_id: rand(1..x), patient_id: rand(1..x), date: Faker::Date.forward(10), city_id: rand(1..4))
end 
10.times do |x| 
  DoctorSpecialty.create(doctor_id: rand(1..x), specialty_id: rand(1..6))
end


