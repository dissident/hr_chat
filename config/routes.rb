Rails.application.routes.draw do

  mount ActionCable.server => '/cable'

  get 'rooms/:id' => 'rooms#show', as: :chat
  get 'create_room/:id' => 'home#create_room'
  get 'create_hr/:id' => 'home#create_hr'

  get 'home/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
end
