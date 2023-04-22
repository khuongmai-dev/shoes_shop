
ActiveAdmin.register ShopUser do

  permit_params :email_address, :phone_number, addresses_attributes: [:id, :unit_number, :street, :postal_code, :city, :_destroy]
  def permitted_params
    params.permit(shop_user: [:email_address, :phone_number, addresses_attributes: [:id, :unit_number, :street, :postal_code, :city, :_destroy]])
  end

  #
  # or
  #
  # permit_params do
  #   permitted = [:email_address, :phone_number, :password]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  controller do
    def create
      @shop_user = ShopUser.new(permitted_params[:shop_user])
      if @shop_user.save
        redirect_to admin_shop_user_path(@shop_user), notice: "ShopUser created successfully"
      else
        render :new
      end
    end

    def update
      @shop_user = ShopUser.find(params[:id])
      if @shop_user.update(permitted_params[:shop_user])
        redirect_to admin_shop_user_path(@shop_user), notice: "ShopUser updated successfully"
      else
        render :edit
      end
    end

    # def destroy
    #   @shop_user = ShopUser.find(params[:id])
    #   if @shop_user.destroy
    #     redirect_to admin_shop_users_path, notice: "ShopUser deleted successfully"
    #   else
    #     redirect_to admin_shop_users_path, alert: "Failed to delete ShopUser"
    #   end
    # end
  end

  form do |f|
    f.semantic_errors
    f.inputs "User Details" do
      f.input :email_address
      f.input :phone_number
    end

    f.inputs "Addresses" do
      f.has_many :addresses, allow_destroy: true, heading: false, new_record: true do |a|
        a.input :unit_number
        a.input :street
        a.input :postal_code
        a.input :city
        a.input :province
        a.input :country, as: :country_select
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :email_address
    column :phone_number
    column :addresses do |shop_user|
      shop_user.address_list
    end
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :email_address
      row :phone_number
      # row :address do |address|
      #   link_to address.unit_number, admin_customer_path(address.shop_user)
      # end
      row :created_at
      row :updated_at
    end
    # panel "Order Details" do
    #   table_for order.order_details do
    #     column :quantity
    #     column :purchase_unit_price
    #     column :product do |product|
    #       link_to product.product.name, admin_product_path(product.product)
    #     end
    #     column :created_at
    #     column :updated_at
    #   end
    # end
  end

end
end