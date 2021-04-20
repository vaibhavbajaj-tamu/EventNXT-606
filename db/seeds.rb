# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

events = [{:title => 'Event Title', :date => '1-Oct-2020', :total_seats => 400, :box_office_customers => '', :total_seats_box_office => 200, :total_seats_guest => 30, :balance => 170},
          {:title => 'Event Title', :date => '2-Oct-2020', :total_seats => 400, :box_office_customers => '', :total_seats_box_office => 300, :total_seats_guest => 20, :balance => 80},
          {:title => 'Event Title', :date => '3-Oct-2020', :total_seats => 500, :box_office_customers => '', :total_seats_box_office => 250, :total_seats_guest => 30, :balance => 220},
  	 ]

events.each do |event|
  Event.create!(event)
end