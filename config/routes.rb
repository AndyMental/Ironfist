Rails.application.routes.draw do

  root "pages#index"

  get "pages/business"

  namespace :dashboard do
    get '', to: 'dashboard#index', as: '/'
  end

  namespace :landing do
    resources :products
  end

  resources :subcategories

  resources :shops

  resources :shop_owners

  resources :products

  resources :products_reiview

  resources :product_images

  resources :enabler

  resources :categories

  resources :admin



  devise_for :users, controllers: {
      sessions: 'users/sessions',
      passwords: 'users/passwords',
      registrations: 'users/registrations'
  }

  get "pages/business"



  # versioning the api
  namespace :api, defaults: { format: :json } do
    namespace :v1 do

      # User routes
      resources :shop_owners, :enablers, only: [:create, :update] do
        collection do
          post :verify_otp
        end
      end
      resources :admins, only: [:create, :update]

      # Categories
      resources :categories, only: [:index, :create]
      resources :subcategories, only: [:index, :create]

      # Products
      resources :products, only: [:index, :create, :show, :destroy]

      # Shops
      resources :shops, only: :create do
        member do
          post :suspend, :enable
        end
      end

      # Customers

      # Cart
      resources :carts, only: :index do
        post 'carts/add'
        patch 'carts/update_quantity'
        delete 'carts/remove'
      end

    end
  end
end
