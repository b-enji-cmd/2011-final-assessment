# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Doctor.destroy_all
Surgery.destroy_all

@doctor_1 = Doctor.create!(name: 'John', years_practiced: 30, uni: 'Case Western')
@doctor_2 = Doctor.create!(name: 'Mary', years_practiced: 40, uni: 'Anchutz')
@doctor_3 = Doctor.create!(name: 'Bruce', years_practiced: 50, uni: 'Anchutz')
@surgery_1 = Surgery.create!(title: 'Heart Transplant', day: 'Tuesday', room: 113 )

@doctor_4 = Doctor.create!(name: 'Mike', years_practiced: 32, uni: 'Anchutz')
@doctor_5 = Doctor.create!(name: 'Julie', years_practiced: 35, uni: 'Anchutz')
@doctor_6 = Doctor.create!(name: 'Annie', years_practiced: 28, uni: 'Anchutz')
@surgery_2 = Surgery.create!(title: 'Triple Bypass', day: 'Friday', room: 221 )

@surgery_1.doctors << @doctor_1
@surgery_1.doctors << @doctor_2
@surgery_1.doctors << @doctor_3

@surgery_2.doctors << @doctor_4
@surgery_2.doctors << @doctor_5
@surgery_2.doctors << @doctor_6