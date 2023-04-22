class BrandsController < ApplicationController
  def index
    @brands = Brand.all
    @categories = Category.all
  end

  def show
    @categories = Category.all
    @brands = Brand.all
    @brand = Brand.find(params[:id])
    @products = @brand.products.all.page(params[:page]).per(16)
  end
end
