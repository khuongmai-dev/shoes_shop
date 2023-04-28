class CheckoutController < ApplicationController
  def index
    @categories = Category.all
  end

  def create
    Stripe.api_key = 'sk_test_51MoWwrLRYeKXQIlspBtS7S87dGlUsS0hpQAyt2CJHpyDklRR5mHg8l6B1xOlbCg9y51uocagw9IgC1O6BGwKpH8h00NSPj1lvv'
    @cart_items = session[:cart]
    @line_items = []
    @cart_items.each do |item|
      @product = Product.find(item["id"])
      @line_items << {
        price_data: {
          currency: 'cad',
          unit_amount: @product.price.to_i * 100,
          product_data: {
            name: @product.name,
            description: @product.description,
          },
          tax_behavior: 'exclusive',
        },
        quantity: item["quantity"]
      }
    end

    #Create Stripe session
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: checkout_cancel_url,
      line_items: [@line_items],
      automatic_tax: {
        enabled: true
      },
      mode: 'payment',
      billing_address_collection: 'required',
    )

    # Redirect to the original page
    redirect_to @session.url, allow_other_host: true
  end

  def success
    @categories = Category.all
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @customer = ShopUser.find_or_create_by(
      email_address: @session.customer_details.email,
      phone_number: @session.customer_details.phone
    )

    @address = Address.includes(:shop_users).find_or_create_by(
      street: @session.customer_details.address.line1,
      postal_code: @session.customer_details.address.postal_code,
      city: @session.customer_details.address.city,
      province: @session.customer_details.address.state,
      country: @session.customer_details.address.country
    )

    # Create a new entry in the orders table
    @order = ShopOrder.new
    @order.shop_user_id = @customer.id
    @order.payment_status = @session.payment_status
    @order.order_subtotal = @session.amount_subtotal.to_f / 100
    @order.order_total = @session.amount_total.to_f / 100
    @order.tax_rate = @session.total_details.amount_tax.to_f / 100
    @order.order_date = @session.created
    @order.address_id = Address.find_or_create_by(
      street: @session.customer_details.address.line1,
      postal_code: @session.customer_details.address.postal_code,
      city: @session.customer_details.address.city,
      province: @session.customer_details.address.state,
      country: @session.customer_details.address.country
    ).id
    @order.order_status_id = OrderStatus.find_or_create_by(
      status: "Paid"
    ).id
    @order.save

    @products = []
    @cart_items = session[:cart]
    @cart_items.each do |item|
      @products << Product.find(item["id"])
      @order_line = OrderLine.new
      @order_line.shop_order_id = @order.id
      @order_line.product_id = item["id"]
      @order_line.quantity = item["quantity"]
      @order_line.price = Product.find(item["id"]).price
      @order_line.save
      session[:cart] = []
    end
  end

  def cancel
    @categories = Category.all
  end
end
