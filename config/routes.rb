Rails.application.routes.draw do
  get 'messages/create'
  get 'chatrooms/show'
  devise_for :users
  root to: 'techgets#dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :techgets do
    resources :rentals
  end
  resources :rentals, only: [:index]
  get 'dashboard', to: 'techgets#dashboard', as: :dashboard
  get 'rentals/:id/update_chatbox', to: 'rentals#update_chatbox', as: :update_chatbox
  get 'rentals/:id/confirm',  to: 'rentals#confirm', as: :confirm
  resources :chat_rooms, only: [ :show ] do
    resources :messages, only: [ :create ]
  end
  mount ActionCable.server => "/cable"
end

