class ShopUsersController < ApplicationController
  before_action :authenticate_shop_user!
  before_action :only_see_own_page, only: [:show]

  def create
    current_id = params[:id]
    @user = ShopUser.find(current_id)
    @address = @user.addresses.create(address_params)

    if @address.save
      redirect_to shop_user_path, notice: "Address was successfully created."
    else
      @address.destroy
      render :new
    end
  end
  def show
    # @user = current_shop_user
    @user = ShopUser.find(params[:id])
    @categories = Category.all
    @addresses = @user.addresses
  end

  private

  def only_see_own_page
    if current_shop_user.id != params[:id].to_i
      redirect_to root_path, notice: "Sorry, but you are only allowed to view your own profile page."
    end
  end

  def address_params
    params.require(:address).permit(:unit_number, :street, :city, :province, :country, :postal_code)
  end
end
