require 'httparty'

Brand.destroy_all
Type.destroy_all
Category.destroy_all

makeup_url = 'https://makeup-api.herokuapp.com/api/v1/products.json'
makeups = HTTParty.get(makeup_url)


makeups.each do |makeup|
  Brand.create(
    brand_name: makeup["brand"]
  )

  Type.create(
    type_name: makeup["product_type"]
  )
end

# characters.each do |character|
#   actor = Actor.find_or_create_by(actor_name: character["voicedBy"])
#   ep = Episode.find_by(title: character["firstEpisode"])

#   if actor && actor.persisted?
#     new_character = actor.characters.create(
#       name: character ["name"],
#       age: character["age"],
#       gender: character["gender"],
#       occupation: character["occupation"],
#       image: character["image"]
#     )
#   else
#     new_character = Character.create(
#       name: character ["name"],
#       age: character["age"],
#       gender: character["gender"],
#       occupation: character["occupation"],
#       image: character["image"]
#     )
#   end

#   if new_character.persisted?
#     CharacterEpisode.create(character: new_character, episode: ep)
#   end
# end

# burgers.each do |burger|
#   ep = Episode.find_by(url: burger["episodeUrl"])
#   ep.burgers.create(
#     burger_name: burger["name"],
#     price: burger["price"]
#   )
# end

# stores.each do |store|
#   ep = Episode.find_by(url: store["episodeUrl"])
#   ep.stores.create(
#     store_name: store["name"],
#     image: store["image"]
#   )
# end

puts "Created #{Brand.count} Brands."
puts "Created #{Type.count} Types."
puts "Created #{Category.count} Categories."


AdminUser.create!(
  email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password'
  ) if Rails.env.development?
