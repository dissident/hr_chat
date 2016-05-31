# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Create users"

User.create([
  {
    email: 'hr@example.com',
    password: 'password',
    role: User::HR_ROLE
  },
  {
    email: 'candidate@example.com',
    password: 'password'
  },
  {
    email: 'candidate2@example.com',
    password: 'password'
  },
  {
    email: 'candidate3@example.com',
    password: 'password'
  },
  {
    email: 'candidate4@example.com',
    password: 'password'
  },
  {
    email: 'candidate5@example.com',
    password: 'password'
  },
  {
    email: 'candidate6@example.com',
    password: 'password'
  },
  {
    email: 'hr2@example.com',
    password: 'password',
    role: User::HR_ROLE
  }
])