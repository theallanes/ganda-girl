class Type < ApplicationRecord
  has_many :categories

  def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "id", "type_name", "updated_at" ]
  end
end
