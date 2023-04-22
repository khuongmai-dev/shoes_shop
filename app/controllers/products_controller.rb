class ProductsController < ApplicationController
  def index
    @products = Product.all.page(params[:page]).per(16)
    @categories = Category.all
  end

  def show
    @product = Product.find(params[:id])
    @categories = Category.all
  end

  def search
    @query = params[:keywords]
    @cateid = params[:cat_id]
    @categories = Category.all
    wildcard_search = "%#{params[:keywords]}%"
    category_id = "#{params[:cat_id]}"
    @selected_category = Category.find_by(id: @cateid)

    if(category_id == "")
      @products = Product.where("name LIKE ? OR description LIKE ?", wildcard_search, wildcard_search).page(params[:page])
    else
      @products = Product.where("name ILIKE ? OR description ILIKE ?", wildcard_search, wildcard_search).where(categories: category_id).page(params[:page])
    end
  end
end
