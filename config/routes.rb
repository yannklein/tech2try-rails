Rails.application.routes.draw do
  devise_for :users
  root to: 'techgets#dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :techgets do
    resources :rentals
  end
  resources :rentals, only: [:index]
  get 'dashboard', to: 'techgets#dashboard', as: :dashboard
end