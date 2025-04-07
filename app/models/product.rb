class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :type

  def self.ransackable_attributes(auth_object = nil)
    [ "brand_id", "created_at", "description", "id", "image", "price", "product_name", "type_id", "updated_at" ]
  end
end
