class CartController < ApplicationController
  before_action :get_product, only: [ :create, :destroy ]

  def create
    unless session[:cart].include?(@product.id)
      session[:cart] << @product.id
      flash[:notice] = "#{@product.product_name} was added to cart"
    end
  end

  def destroy
    if session[:cart].include?(@product.id)
      session[:cart].delete(@product.id)
      flash[:notice] = "#{@product.product_name} was removed from cart"
    end
  end

  private

  def get_product
    product_id = params[:id].to_i
    @product = Product.find(product_id)
  end
end
