class AddressesController < ApplicationController
  before_action :set_user

  def new
    @address = Address.new
  end

  def create
    puts params.inspect
    @address = Address.new(address_params)
    @address.user_id = @user.id

    if @address.save
      redirect_to shop_user_path(@user), notice: 'Address was successfully created.'
    else
      render :new
    end
  end

  private

  def address_params
    params.require(:address).permit(:unit_number, :street, :city, :province, :country, :postal_code)
  end

  def set_user
    @user = ShopUser.find(params[:shop_user_id])
  end
end
