class Category < ApplicationRecord
  belongs_to :type

  validates :category_name, uniqueness: true, presence: true

  def self.ransackable_associations(auth_object = nil)
    [ "type" ]
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "category_name", "created_at", "id", "type_id", "updated_at" ]
  end
end
