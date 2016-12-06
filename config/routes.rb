Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do
  end
  resources :teams, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :challenges, only: [:index, :show] do
      resources :answers
    end
  end
  resources :cities, only: [:index, :show]

end
