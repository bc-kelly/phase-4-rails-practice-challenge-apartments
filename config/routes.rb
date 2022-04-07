Rails.application.routes.draw do
  resources :leases, only: [:index, :destroy]
  resources :tenants
  resources :apartments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/apartments', to: 'apartments#index'
  get '/apartments/:id', to: 'apartments#show'

end
