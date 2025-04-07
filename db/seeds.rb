require 'httparty'

AdminUser.destroy_all
# Brand.destroy_all
# Type.destroy_all
Category.destroy_all
Product.destroy_all
Tag.destroy_all


makeup_url = 'https://makeup-api.herokuapp.com/api/v1/products.json'
makeups = HTTParty.get(makeup_url)


makeups.each do |makeup|
  # Brand.create(
  #   brand_name: makeup["brand"]
  # )

  Type.create(
    type_name: makeup["product_type"]
  )

  type = Type.find_by(type_name: makeup["product_type"])
  type.categories.create(
    category_name: makeup["category"]
  )
end

makeups.each do |makeup|
  tag = Tag.find_or_create_by(product_name: makeup["tag_list"])
  product = Product.find_by(tag_name: makeup["name"])

  if tag && tag.persisted?
    new_product = tag.products.create(
      product_name: makeup ["name"],
      description: makeup["description"],
      price: makeup["price"].to_d,
      image: makeup["api_featured_image"],
    )
  else
    new_product = Product.create(
      product_name: makeup ["name"],
      description: makeup["description"],
      price: makeup["price"].to_d,
      image: makeup["api_featured_image"],
    )
  end

  if new_character.persisted?
    ProductTag.create(product: new_product, tag: ep)
  end
end

puts "Created #{Brand.count} Brands."
puts "Created #{Type.count} Types."
puts "Created #{Category.count} Categories."
puts "Created #{Tag.count} Tags."
puts "Created #{Product.count} Products."


AdminUser.create!(
  email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password'
  ) if Rails.env.development?
