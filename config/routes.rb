Rails.application.routes.draw do

  devise_for :users

  root to: "items#index"

  resources :users, only: :show
  
  resources :addresses,only: [:index,:new,:create,:edit,:update,:destroy]

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

  resources :cards, only:[:index, :new, :create,:destroy,:show] do
    member do
      post 'pay'
    end
  end

end

