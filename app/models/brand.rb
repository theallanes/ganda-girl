class Brand < ApplicationRecord
  has_many :products

  validates :brand_name, uniqueness: true

  def self.ransackable_attributes(auth_object = nil)
    [ "brand_name", "created_at", "id", "updated_at" ]
  end
end
