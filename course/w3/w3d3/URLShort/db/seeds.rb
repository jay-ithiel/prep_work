# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do

  User.create!(:email => "cj@gmail.com")
  User.create!(:email => "flarnie@hotmail.com")
  User.create!(:email => "jeff@yahoo.com")
  User.create!(:email => "gsp@ufc.com")
  User.create!(:email => "ned@gmail.com")


  ShortenedUrl.create!(:short_url => "www.google.com", :long_url => "www.gooooooogle.com", :owner_id => 1)
  ShortenedUrl.create!(:short_url => "www.hotmail.com", :long_url => "www.hoootttmaaaail.com", :owner_id => 2)
  ShortenedUrl.create!(:short_url => "www.yahoo.com", :long_url => "www.yaaahoooooo.com", :owner_id => 3)
  ShortenedUrl.create!(:short_url => "www.ufc.com", :long_url => "www.uuuuuffffcccccc.com", :owner_id => 4)
  ShortenedUrl.create!(:short_url => "www.gmail.com", :long_url => "www.gmaailllll.com", :owner_id => 5)

  Visit.create!(user_id: 1, short_url_id: 5)
  Visit.create!(user_id: 2, short_url_id: 4)
  Visit.create!(user_id: 3, short_url_id: 3)
  Visit.create!(user_id: 1, short_url_id: 5)
  Visit.create!(user_id: 4, short_url_id: 2)
  Visit.create!(user_id: 2, short_url_id: 5)
  Visit.create!(user_id: 3, short_url_id: 3)
  Visit.create!(user_id: 1, short_url_id: 5)
  Visit.create!(user_id: 1, short_url_id: 5)

end
