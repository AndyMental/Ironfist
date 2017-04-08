Rails.application.routes.draw do

  root to: "pages#index"

  devise_for :users, controllers: {
      sessions: 'users/sessions',
      passwords: 'users/passwords',
      registrations: 'users/registrations'
  }

  get "pages/business"

end
