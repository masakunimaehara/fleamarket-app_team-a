Rails.application.routes.draw do

  devise_for :users

  root to: "items#index"

  resources :users, only: :show do 
    collection do
      get 'address_new'
      post 'address_create'
      get 'address_edit'
      patch 'address_update'
    end
  end

  resources :items do
    resources 'purchase' ,only: [:index]
    collection do
      get 'category_children', defaults: { format: 'json' }
      get 'category_grandchildren', defaults: { format: 'json' }
    end
    member do
     get  'list_from_category'
    end
  end

  resources :categories, only: [:index] 

  resources :cards, only:[:index, :new, :create,:destroy]

end

