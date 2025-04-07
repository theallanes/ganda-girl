require 'httparty'


AdminUser.destroy_all
ProductTag.destroy_all
Product.destroy_all
Tag.destroy_all
# Brand.destroy_all
# Type.destroy_all
# Category.destroy_all



makeup_url = 'https://makeup-api.herokuapp.com/api/v1/products.json'
makeups = HTTParty.get(makeup_url)


makeups.each do |makeup|
  # Brand.create(
  #   brand_name: makeup["brand"]
  # )

  # Type.create(
  #   type_name: makeup["product_type"]
  # )

  # type = Type.find_by(type_name: makeup["product_type"])
  # type.categories.create(
  #   category_name: makeup["category"]
  # )
end

makeups.each do |makeup|
  makeup["tag_list"].each do |tag|
    new_tag = Tag.find_or_create_by(
      tag_name: tag
    )

    if new_tag && new_tag.persisted?
      new_product = new_tag.products.create(
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

    if new_product.persisted?
      ProductTag.create(product: new_product, tag: new_tag)
    end
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
