# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'faker'

100.times do 
    
    
    Contact.create(
        
        :first_name => Faker::Name.first_name,
        :last_name  => Faker::Name.last_name,
        :email      => Faker::Internet.safe_email,
        :phone      => Faker::PhoneNumber.cell_phone,
        :present_address => Faker::Address.city + Faker::Address.street_name +
            Faker::Address.street_address,
        :permanent_address => Faker::Address.city + Faker::Address.street_name+
            Faker::Address.street_address,
        :about => Faker::Lorem.paragraph,
        :facebook_link => Faker::Internet.url,
        :google_link => Faker::Internet.url,
        :twitter_link => Faker::Internet.url,
        
        :profile_img => Faker::Avatar.image,
        
        :cover_pic => Faker::Placeholdit.image,
    )
    
    
end


