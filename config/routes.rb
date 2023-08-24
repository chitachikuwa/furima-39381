Rails.application.routes.draw do
  devise_for :users
 root 'items#index'
 resources :users, omly: [:new, :careate]
end
