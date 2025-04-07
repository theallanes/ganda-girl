class Tag < ApplicationRecord
  has_many :product_tags
  has_many :products, through: :product_tags

  validates :tag_name, uniqueness: true

  def self.ransackable_associations(auth_object = nil)
    [ "product_tags", "products" ]
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "id", "id_value", "tag_name", "updated_at" ]
  end
end
