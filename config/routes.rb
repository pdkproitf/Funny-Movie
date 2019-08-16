Rails.application.routes.draw do
  resources :shares
  devise_for :users
end
