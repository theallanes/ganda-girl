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

  def self.search(search)
    if search
      product = Product.where('product_name LIKE ?', "%#{search}%")
      if product
        self.where(id: product)
      else
        @products = Product.all
      end
    else
      @products = Product.all
    end
  end

  private

  def product_params
    params.require(:character).permit(:name, :search)
  end
end
