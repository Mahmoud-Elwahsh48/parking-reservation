Rails.application.routes.draw do
  devise_for :visitors, controllers: {
    sessions: 'visitors/sessions',
    registrations: 'visitors/registrations',
    passwords: 'visitors/passwords'
  }
  devise_for :users

  resources :offers, only: [:index]

  namespace :owner do
    resources :offers, only: %i[new create edit update destroy index]
  end

  root to: 'home#index'
end
