Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  namespace :admin do
    resources :organizations, only: [ :index, :show ]
    resources :users, only: [ :index, :show ]
  end

  namespace :org do
    resources :users
  end
  get '/dashboard', to: 'org/users#dashboard'

end
