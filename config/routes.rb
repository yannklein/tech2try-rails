Rails.application.routes.draw do
  devise_for :users
  root to: 'techgets#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :techgets
  resources :rentals

end
