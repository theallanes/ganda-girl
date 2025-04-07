class ProductTag < ApplicationRecord
  belongs_to :product
  belongs_to :tag

  def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "id", "product_id", "tag_id", "updated_at" ]
  end
end
