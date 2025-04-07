class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :type
  has_many :product_tags
  has_many :tags, through: :product_tags

  validates :product_name, uniqueness: true

  def self.ransackable_attributes(auth_object = nil)
    [ "brand_id", "created_at", "description", "id", "image", "price", "product_name", "type_id", "updated_at" ]
  end
end
