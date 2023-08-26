Rails.application.routes.draw do
  devise_for :users
 root 'items#index'
 resources :users, omly: [:show, :update]
end
