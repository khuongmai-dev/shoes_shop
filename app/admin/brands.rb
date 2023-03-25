ActiveAdmin.register Brand do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :parent_id, :name, :image
  #
  # or
  #
  # permit_params do
  #   permitted = [:parent_id, :name, :brand_image]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do |f|
    f.semantic_errors
    f.inputs
    f.inputs do
      f.input :image, as: :file, hint: f.object.image.present? ? image_tag(f.object.image) : content_tag(:span, "no images yet")
    end
    f.actions
  end

  show do
    panel "Brand Details" do
      attributes_table_for brand do
        row :parent
        row :name
        row :created_at
        row :updated_at
        row :image do
          if brand.image.attached?
            image_tag(brand.image, size: "300x300")
          end
        end
      end
    end
  end
end
