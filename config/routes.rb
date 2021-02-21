Rails.application.routes.draw do
  root to: 'spaces#index'
  devise_for :users
  resources :spaces do
    resources :orders, only: [:new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
