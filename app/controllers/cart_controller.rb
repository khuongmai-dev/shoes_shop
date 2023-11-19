class CartController < ApplicationController

  def create
    current_id = params[:id]
    @product = Product.find(current_id)
    if session[:cart].map{ |item| item['id']}.include?(current_id)
      flash[:notice] = "Click view Cart to change the quantity of this item"
    else
      session[:cart] << {"id" => params[:id], "quantity" => params[:quantity]}
    end
      redirect_to cart_index_path()
  end

  def destroy
    current_id = params[:id]
    session[:cart].delete_if { |item| item["id"] == current_id }

    flash[:notice] = "This item is removed from cart."
    flash[:mobile_notice] = "Removed."
    redirect_back(fallback_location: root_path)

  end

  def update
    current_id = params[:id]
    update_quantity = params[:update_quantity].to_i
    session[:cart].find { |item| item["id"] == current_id}["quantity"] = update_quantity

    flash[:notice] = "This item's quantity has been updated."
    flash[:mobile_notice] = "Quantity updated."

    redirect_back(fallback_location: root_path)
  end

  def index
    @categories = Category.all
    @cart = session[:cart]
    @products = []

    @cart.each do |item|
      @products << Product.find(item["id"])
    end

    @total = 0
    @products.each do |product|
      @total += product.price * session[:cart].find { |item| item["id"] == product.id.to_s }["quantity"].to_i
    end
  end
end
