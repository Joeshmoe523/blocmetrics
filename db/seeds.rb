require 'faker'

#Create Eventbrite Application
eventbrite = RegisteredApplication.new(
  name: "Eventbrite",
  url: "http://www.eventbrite.com"
  )
eventbrite.save!

#Create Facebook Events Application
facebook = RegisteredApplication.new(
  name: "Facebook Events",
  url: "http://www.facebook.com/events"
  )
facebook.save!

#Create Sosh Application
sosh = RegisteredApplication.new(
  name: "Sosh Events",
  url: "http://www.sosh.com"
  )
sosh.save!

applications = RegisteredApplication.all

#Create events
15.times do 
  Event.create(
    name: Faker::Lorem.sentence,
    registered_application: applications.sample
  )
end

puts "Seed finished."
puts "#{Event.count} events created."

