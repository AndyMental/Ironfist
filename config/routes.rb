Rails.application.routes.draw do

  root to: "pages#index"

  namespace :admin do
    resources :products
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
end
