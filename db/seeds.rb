# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Employee.create!(
    first_name: 'System1',
    last_name:  'Admin1',
    contact:    '1234',
    address:    '1234',
    email:      'admin1@example.com',
    password:   'password',
    employee_type: '0')
