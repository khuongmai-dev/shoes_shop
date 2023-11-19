Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  get 'checkout/index'
  get 'shopping_cart_items/index'
  get 'profile/show'
  get 'shop_users/show'
  get 'cart/index'
  get 'brands/index'
  get 'brands/show'
  get 'products/index'
  get 'products/show'

  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "products#index"

  resources :products, only: [:index, :show] do
    collection do
      get :search
    end
  end

  resources :categories, only: [:index, :show]

  resources :brands, only: [:index, :show]

  get 'pages/:permalink', to: 'pages#show', as: 'page'
  # resources :pages

  # devise_for :shop_users
  devise_for :shop_users, controllers: {
    sessions: 'shop_users/sessions',
    registrations: 'shop_users/registrations',
    passwords: 'shop_users/passwords',
    confirmations: 'shop_users/confirmations'
  }
  get '/profile', to: 'shop_users#profile', as: :shop_user_profile

  devise_scope :shop_user do
    get '/shop_users/sign_out', to: 'devise/sessions#destroy'
  end

  resources :shop_users, only: [:show] do
    resources :addresses, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :cart, only: [:index , :destroy, :update]
  post '/cart', to: 'cart#create', as: 'add_to_cart'

  scope "/checkout" do
    post "/create", to: "checkout#create", as: "checkout_create"
    get "/success", to: "checkout#success", as: "checkout_success"
    get "/cancel", to: "checkout#cancel", as: "checkout_cancel"
  end
end