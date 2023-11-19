ActiveAdmin.register Address do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :unit_number, :street, :postal_code, :city, :province, :country
  #
  # or
  #
  # permit_params do
  #   permitted = [:unit_number, :street, :postal_code, :city, :province, :country]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
