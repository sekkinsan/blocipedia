# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'random_data'


#create users
5.times do
    User.create!(
        email: RandomData.random_email,
        password: RandomData.random_sentence
    )
end

#create admin
admin = User.create!(
    email: 'admin@example.com',
    password: 'password',
    role: 'admin'
)

#create standard member
member = User.create!(
    email: 'member@example.com',
    password: 'password'
)

#create premium member
premium = User.create!(
    email: 'premium@example.com',
    password: 'password',
    role: 'premium'
)


#create wikis
10.times do
    Wiki.create!(
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph
    )
end

user = User.first
user.update_attributes!(
    email: 'jacob.yun429@gmail.com',
    password: 'password'
)

users = User.all
wikis = Wiki.all



puts "#{User.count} users created."
puts "#{Wiki.count} wikis created."

puts "Seed finished"

