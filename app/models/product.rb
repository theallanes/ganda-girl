class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :type
  has_many :product_tags
  has_many :tags, through: :product_tags

  has_one_attached :image

  validates :product_name, uniqueness: true, presence: true
  validates :price, numericality: true

  def self.ransackable_attributes(auth_object = nil)
    [ "brand_id", "created_at", "description", "id", "image", "price", "product_name", "type_id", "updated_at" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "brand", "product_tags", "tags", "type" ]
  end

  def self.search(search, brand_id = nil)
    products = Product.all

    if search.present?
      products = products.where('product_name LIKE ?', "%#{search}%")
    end

    if brand_id.present?
      products = products.where(brand_id: brand_id)
    end

    products
  end

  private

  def product_params
    params.require(:product).permit(:name, :search)
  end
end
