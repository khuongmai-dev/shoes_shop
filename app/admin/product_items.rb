ActiveAdmin.register ProductItem do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :product_id, :SKU, :stock_quantity, :price, :image
  #
  # or
  #
  # permit_params do
  #   permitted = [:product_id, :SKU, :stock_quantity, :product_image, :price]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.semantic_errors
    # f.inputs
    f.inputs do
      f.input :variation_options do |variation|
        variation.inputs :name, :as => :select
      end

      f.input :product_id, :as => :select, collection: Product.all.map { |p| [p.name, p.id] }, include_blank: false

      # Variations input
      f.inputs "Variations" do
        f.input :variation_option_ids, as: :select, collection: Variation.all.map { |v| [v.name, v.id] }
      end

      # Variation options input
      f.input :stock_quantity
      f.input :price
      f.input :image, as: :file, hint: f.object.image.present? ? image_tag(f.object.image) : content_tag(:span, "no images yet")
    end
    f.actions
  end


  show do
    panel "Product Details" do
      attributes_table_for product_item do
        row :parent
        row :name
        row :created_at
        row :updated_at
        row :image do
          if product_item.image.attached?
            image_tag(product_item.image, size: "300x300")
          end
        end
      end
    end
  end
end
