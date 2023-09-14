Rails.application.routes.draw do
  resources :tenants, only: [:index, :show, :create, :destroy, :edit, :update]
  resources :rooms
  resources :dues

  post '/login', to: 'sessions#create'
  post '/request_password_reset', to: 'tenants#request_password_reset'
  post '/reset_password', to: 'tenants#reset_password'
  
end
