Rails.application.routes.draw do
  root to: 'home#index'

  resources :shares
  devise_for :users
end
