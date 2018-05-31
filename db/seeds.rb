# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  board = Board.create(
    name: Faker::Music.instrument
  )


  20.times do
    artist = board.artists.create(
      name: Faker::RockBand.name
    )

    10.times do
      artist.songs.create(
        name: Faker::Zelda.item,
        rating: Faker::Number.between(1, 100)
      )
    end
  end
end