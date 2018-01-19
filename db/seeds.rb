# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "~~~~ START seeding data ~~~~"

puts "-- Authors:: Start --"
  1000.times do
    Author.create!(
      name: Faker::Name.name,
      author_bio: Faker::Hipster.sentences(rand(50..100)).join(' '),
      profile_pic: Faker::Avatar.image,
      academics: Faker::University.name,
      awards: Faker::LeagueOfLegends.masteries
    )
  end
puts "-- Authors:: End --"

puts "-- Books:: Start --"
  genre_arr = %w(
    science_fiction
    satire
    drama
    action_and_adventure
    romance
    mystery
    horror
    self_help
    fantasy
  )

  rating_arr = %w(1 2 3 4 5)

  5000.times do
    book = Book.create!(
      name_of_book: Faker::Book.title,
      short_description: Faker::Hipster.sentences(rand(10..15)).join(' '),
      long_description: Faker::Hipster.paragraphs(rand(10..15)).join(' '),
      chapter_index: Faker::Number.digit.to_i,
      date_of_publication: Faker::Date.between(20.years.ago, Date.today),
      genre: genre_arr.sample
    )

    5.times do
      book.reviews.create!(
        name_of_reviewer: Faker::Name.name,
        star_rating: rating_arr.sample.to_i,
        review_title: Faker::Hipster.sentence,
        review_description: Faker::Hipster.paragraphs(rand(10..15)).join(' ')
      )
    end
  end
puts "-- Books:: End --"

puts "~~~~ END seeding data ~~~~"