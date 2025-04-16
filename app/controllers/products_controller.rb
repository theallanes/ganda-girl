class ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(30).search(params[:search])
  end

  def show
    @product = Product.includes(:brand, :type).find(params[:id])
  end
end
