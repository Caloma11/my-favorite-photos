# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

# Creating users and artitst profiles to them

artist_count = 0

10.times do
  user = User.new(
    email: Faker::Internet.email,
    password: 123123
  )

  user.save!

  Artist.create(
    bio: Faker::TvShows::TwinPeaks.quote,
    specialty: Faker::Hacker.adjective,
    user: user
  )
  artist_count += 1
  puts "#{artist_count} artists created"
end

# Attaching photos to artists

urls = []

counter = 1
times_counter = 0
base_url = "https://pokeapi.glitch.me/v1/pokemon/"

45.times do

  # Grab a pokemon from api
  json_response = JSON.parse(open("#{base_url}#{counter}").read)

  # Opening it's url to retrieve an image
  image_url = json_response[0]["sprite"]

  next if urls.include?(image_url)

  urls << image_url
  file = URI.open(json_response[0]["sprite"])

  # Grabbing a random artist
  artist = Artist.all.sample

  # Attaching that image to the selected artist
  artist.photos.attach(io: file, filename: "poke-#{counter}.png", content_type: 'image/png')

  counter += rand(3)

  times_counter += 1
  puts "#{times_counter} photos attached to artists"
end

# Favorite a bunch of images for different users

favorite_count = 1

120.times do
  Favorite.create(
    user: User.all.sample,
    active_storage_blob: ActiveStorage::Blob.all.sample
  )
  puts "#{favorite_count} favorites created"
  favorite_count += 1
end

p urls.map { |a| {url: a, count: urls.count(a) } }
