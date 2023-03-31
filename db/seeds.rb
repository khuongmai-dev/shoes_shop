# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#Remove the existing data
# Country.delete_all
# Province.delete_all
# Address.delete_all
# Shop_user.delete_all
# UserAddress.delete_all
# Promotion.delete_all
# Category.delete_all
# CategoryPromotion.delete_all
# Brand.delete_all
# Product.delete_all
# ProductItem.delete_all
# Variation.delete_all
# VariationOption.delete_all
# ProductItemVariationOption.delete_all
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
# Page.delete_all

# Create the ActiveAdmin user
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

#Create the data for Page model
Page.find_or_create_by(title: 'Contact Us', content: 'Contact Page', permalink: 'contact')
Page.find_or_create_by(title: 'About Us', content: 'About Page', permalink: 'about')