require 'httparty'

Brand.destroy_all
Type.destroy_all
Category.destroy_all
AdminUser.destroy_all

makeup_url = 'https://makeup-api.herokuapp.com/api/v1/products.json'
makeups = HTTParty.get(makeup_url)


makeups.each do |makeup|
  Brand.create(
    brand_name: makeup["brand"]
  )

  # Type.create(
  #   type_name: makeup["product_type"]
  # )

  # type = Type.find_by(type_name: makeup["product_type"])
  # type.categories.create(
  #   category_name: makeup["category"]
  # )
end

puts "Created #{Brand.count} Brands."
puts "Created #{Type.count} Types."
puts "Created #{Category.count} Categories."


AdminUser.create!(
  email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password'
  ) if Rails.env.development?
