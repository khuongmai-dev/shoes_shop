class CartController < ApplicationController
  def index
    @categories = Category.all
    @cart = session[:shopping_cart]
    @products = []

  end
end
