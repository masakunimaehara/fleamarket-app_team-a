Rails.application.routes.draw do

  devise_for :users

  root to: "homes#index"
  
  resources :users, only: :show
  resources :items

  # resources :card, only: [:new, :show] do
  #   collection do
  #     post 'show', to: 'card#show'
  #     post 'pay', to: 'card#pay'
  #     post 'delete', to: 'card#delete'
  #   end
  # end
  resources :cards
end
