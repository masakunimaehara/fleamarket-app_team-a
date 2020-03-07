Rails.application.routes.draw do
  root to: 'users#index'
  get 'users/index'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :cards, only: [:new, :show, :destroy] do
    collection do
      post 'pay', to: 'cards#pay'
    end
  end
end
