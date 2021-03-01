# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  today_date = Date.today
7.times do |x|  
  
  start_time = 10
  
  9.times do
    end_time = start_time + 1
    @space = Space.new(
      start_time: start_time,
      end_time: end_time,
      day: today_date
    )

    start_time = start_time + 1
    @space.save!
  end
 
  today_date = today_date + 1.day
end
