class Type < ApplicationRecord
  has_many :categories
  has_many :products

  validates :type_name, uniqueness: true

  def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "id", "type_name", "updated_at" ]
  end
end
