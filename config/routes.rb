Rails.application.routes.draw do
  root to: 'shares#index'

  resources :shares
  devise_for :users
end
