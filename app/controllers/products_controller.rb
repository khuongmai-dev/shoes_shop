class ProductsController < ApplicationController
  def index
    @products = Product.all.page(params[:page]).per(16)
    @categories = Category.all

  end

  def show
    current_id = params[:id]
    @product = Product.find(current_id)
    @categories = Category.all
    @cart = session[:cart]

    if @cart.map {|item| item["id"]}.include?(current_id)
      @item_in_cart = true
      @item_quantity = @cart.find {|item| item["id"] == current_id}["quantity"]
    end
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
