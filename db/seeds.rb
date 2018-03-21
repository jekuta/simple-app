# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create users
$users = []

5.times { $users << User.new(name: Faker::Dune.unique.character) }
5.times { $users << User.new(name: Faker::BackToTheFuture.unique.character) }

5.times { $users << User.new(name: Faker::Friends.unique.character) }
5.times { $users << User.new(name: Faker::GameOfThrones.unique.character) }

5.times { $users << User.new(name: Faker::Hobbit.unique.character) }
5.times { $users << User.new(name: Faker::HarryPotter.unique.character) }

5.times { $users << User.new(name: Faker::HitchhikersGuideToTheGalaxy.unique.character) }
5.times { $users << User.new(name: Faker::StarWars.unique.character) }

5.times { $users << User.new(name: Faker::TheFreshPrinceOfBelAir.unique.character) }
5.times { $users << User.new(name: Faker::TwinPeaks.unique.character) }

User.import!($users, recursive: true)

dune_quote = -> { Faker::Dune.quote }
btof_quote = -> { Faker::BackToTheFuture.quote }
friends_quote = -> { Faker::Friends.quote }
got_quote = -> { Faker::GameOfThrones.quote }
venture_quote = -> { Faker::VentureBros.quote }
hitch_quote = -> { Faker::HitchhikersGuideToTheGalaxy.quote }
hobbit_quote = -> { Faker::Hobbit.quote }
harry_quote = -> { Faker::HarryPotter.quote }
lovecrat_quote = -> { Faker::Lovecraft.sentences.join(' ') }
mim_quote = -> { Faker::MostInterestingManInTheWorld.quote }
starwars_quote = -> { Faker::StarWars.quote }
prince_quote = -> { Faker::TheFreshPrinceOfBelAir.quote }
twin_peaks_quote = -> { Faker::TwinPeaks.quote }
witcher_quote = -> { Faker::Witcher.quote }
wow_quote = -> { Faker::WorldOfWarcraft.quote }
vendetta_quote = -> { Faker::VForVendetta.quote }

quotes = [
  dune_quote, btof_quote, friends_quote, venture_quote, hitch_quote, got_quote, hobbit_quote,
  harry_quote, lovecrat_quote, mim_quote, starwars_quote, prince_quote, twin_peaks_quote,
  witcher_quote, wow_quote, vendetta_quote
]
post_content = -> { rand(2..10).times.map { quotes.sample.call }.join(' ') }

posts = []

$users.each do |user|
  posts += 6.times.map { Post.new(user: user, title: quotes.sample.call, content: post_content.call) }
  posts.each { |post| post.comments = 10.times.map { Comment.new(user: $users.sample, content: quotes.sample.call) } }
end

Post.import!(posts, recursive: true)
