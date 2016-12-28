# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
heroes = [
  {name: 'koryushka'},
  {name: 'Victor'},
  {name: 'Vitya'},
  {name: 'Liza'},
  {name: 'Mr. Nice'},
  {name: 'Narco'},
  {name: 'Bombasto'},
  {name: 'Celeritas'},
  {name: 'Magneta'},
  {name: 'RubberMan'},
  {name: 'Dynama'},
  {name: 'Dr IQ'},
  {name: 'Magma'},
  {name: 'Tornado'}
]
5000.times do |i|
  heroes << {name: "hero_#{i}"}
end
Hero.create!(heroes)
