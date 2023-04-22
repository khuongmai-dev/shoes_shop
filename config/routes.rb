Rails.application.routes.draw do
  get 'cart/index'
  get 'brands/index'
  get 'brands/show'
  get 'products/index'
  get 'products/show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "products#index"

  resources :products, only: [:index, :show] do
    collection do
      get :search
    end
  end

  resources :cart
  resources :categories, only: [:index, :show]

  resources :brands, only: [:index, :show]

  get 'pages/:permalink', to: 'pages#show', as: 'page'
  # resources :pages
end
