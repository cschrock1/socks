# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user = User.find_or_initialize_by({ email: "nathan.feaver@gmail.com" })
user.password = "password"
user.save

[
  {
    id: 1,
    age: 4,
    color: "green",
    description: "I'm a quiet sock that enjoys long walks in the park.",
    gender: "male",
    height: "knee-high",
    name: "Jerry"
  },
  {
    id: 2,
    age: 2,
    color: "blue",
    description: "A cheerful sock who hums to itself while tumbling in the dryer.",
    gender: "female",
    height: "ankle",
    name: "Bubbles"
  },
  {
    id: 3,
    age: 7,
    color: "red",
    description: "Bold, dramatic, and absolutely convinced laundry day is a conspiracy.",
    gender: "male",
    height: "crew",
    name: "Rocco"
  },
  {
    id: 4,
    age: 5,
    color: "yellow",
    description: "Loves sunshine, mismatched outfits, and spontaneous adventures.",
    gender: "female",
    height: "knee-high",
    name: "Sunny"
  },
  {
    id: 5,
    age: 10,
    color: "black",
    description: "Minimalist sock with a deep appreciation for symmetry and order.",
    gender: "non-binary",
    height: "dress",
    name: "Mono"
  },
  {
    id: 6,
    age: 1,
    color: "pink",
    description: "Still figuring things out but very optimistic about drawers.",
    gender: "female",
    height: "ankle",
    name: "Peaches"
  },
  {
    id: 7,
    age: 8,
    color: "striped",
    description: "World traveler who claims to have seen every washing machine brand.",
    gender: "male",
    height: "crew",
    name: "Marco"
  },
  {
    id: 8,
    age: 6,
    color: "purple",
    description: "Creative sock who dreams of becoming a scarf one day.",
    gender: "non-binary",
    height: "knee-high",
    name: "Velour"
  }
].each do |sock_params|
  id = sock_params.delete(:id)
  sock = Sock.new
  sock.owner = user
  if id
    sock = Sock.find_or_initialize_by(id: id)
  end
  sock.assign_attributes(sock_params)
  sock.save
end

[ [ 1, 4 ], [ 3, 7 ] ].each do |match_id_1, match_id_2|
  Match.find_or_create_by(sock_1_id: match_id_1, sock_2_id: match_id_2)
end
