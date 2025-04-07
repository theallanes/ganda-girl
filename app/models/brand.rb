class Brand < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    [ "brand_name", "created_at", "id", "updated_at" ]
  end
end
