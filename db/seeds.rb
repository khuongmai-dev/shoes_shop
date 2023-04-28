require 'csv'
require 'faker'
require 'open-uri'
# require 'fileutils'
require_relative '../app/models/product.rb'

#Remove the existing data
AdminUser.delete_all
Page.delete_all

Product.delete_all
Brand.delete_all
Category.delete_all

ActiveRecord::Base.connection.execute("SELECT setval('products_id_seq', 1, false)")
ActiveRecord::Base.connection.execute("SELECT setval('brands_id_seq', 1, false)")
ActiveRecord::Base.connection.execute("SELECT setval('categories_id_seq', 1, false)")
# Country.delete_all
# Province.delete_all
# Address.delete_all
# ShopUser.delete_all
# UserAddress.delete_all
# Promotion.delete_all

# CategoryPromotion.delete_all

# Product.delete_all
# ShoppingCartItem.delete_all
# ShoppingCart.delete_all
# OrderLine.delete_all
# ShopOrder.delete_all
# ShippingMethod.delete_all
# TaxRate.delete_all
# OrderStatus.delete_all
# UserPaymentMethod.delete_all
# PaymentType.delete_all
# UserReview.delete_all

# Create the ActiveAdmin user
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

#Create the data for Page model
Page.find_or_create_by(title: 'Contact Us', content: 'Contact Page', permalink: 'contact')
Page.find_or_create_by(title: 'About Us', content: 'About Page', permalink: 'about')

#Create the data for Brand
brand_image_data = {
  'Adidas' => 'adidas.webp',
  'Converse' => 'Converse.webp',
  'Nike' => 'nike.jpeg',
  'Vans' => 'Vans.png'
}

brand_image_data.each do |brand_name, image_file|
  brand = Brand.find_or_create_by(name: brand_name)
  brand.image.attach(
    io: File.open(File.join(Rails.root, "app/assets/images/brands/#{image_file}")),
    filename: image_file
  )
end

#Create the data for Category
category_data = {
  'Men' => {
    'Shoes' => [
      'All Shoes & Footwear',
      "Men's Road, Trail & Racing Running Shoes",
      'Training',
      'Sneakers',
      'Boots',
      'Basketball',
      'Sandals',
      'Soccer',
      'Baseball & Softball',
      'Skate',
      'Casual',
      'Hiking & Outdoor',
      'Golf',
      'Walking',
      'Indoor Court',
      'Tennis',
      'Football & Rugby',
      'Wrestling'
    ]},
    'Women' => {
      'Shoes' => [
        'All Shoes & Footwear',
        "Men's Road, Trail & Racing Running Shoes",
        'Training',
        'Sneakers',
        'Boots',
        'Basketball',
        'Sandals',
        'Soccer',
        'Baseball & Softball',
        'Skate',
        'Casual',
        'Hiking & Outdoor',
        'Golf',
        'Walking',
        'Indoor Court',
        'Tennis',
        'Football & Rugby',
        'Wrestling'
      ]
    }
}

category_data.each do |parent_name, children|
  parent_category = Category.find_or_create_by(name: parent_name)
  children.each do |child_name, sub_children|
    child_category = parent_category.children.find_or_create_by(name: child_name)
    sub_children.each do |sub_child_name|
      child_category.children.find_or_create_by(name: sub_child_name)
    end
  end
end

#create data for Product model

filename = Rails.root.join("db/shoes_shop.csv")

csv_data = File.read(filename)
shoes = CSV.parse(csv_data, headers:true, encoding: "utf-8")

puts "#{shoes.size}"

shoes.each do |s|
  brand = Brand.find_or_create_by(name: s['brand'])
  category = Category.find_or_create_by(name: s['category'])

  # puts "#{brand.id}"
  # puts "#{category.id}"
  shoe = Product.create(
    category_id:      category.id,
    name:             s['name'],
    description:      Faker::Lorem.paragraph(sentence_count: 2),
    brand_id:      brand.id,
    price:            s['price'],
    stock_quantity:   Faker::Number.within(range: 1...10000),
    product_image:        s['url']
  )
  # Download the image and save it to your local project
  image_url = s['url']
  file = URI.open(image_url)

  # Get the file extension from the URL
  file_extension = File.extname(image_url)

  # Generate a unique file name based on the current timestamp
  file_name = "#{Time.now.to_i}#{file_extension}"
  # Attach the saved image to the product using ActiveStorage
  shoe.image.attach(io: file, filename: file_name)
  # puts "#{shoe.errors.full_messages.join(', ')}"
end

#Create the order status
OrderStatus.find_or_create_by(name: 'Paid')
OrderStatus.find_or_create_by(name: 'Processing')
OrderStatus.find_or_create_by(name: 'Shipped')
OrderStatus.find_or_create_by(name: 'Delivered')
OrderStatus.find_or_create_by(name: 'Cancelled')
OrderStatus.find_or_create_by(name: 'Refunded')
OrderStatus.find_or_create_by(name: 'Returned')