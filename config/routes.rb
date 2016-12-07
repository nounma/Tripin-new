Rails.application.routes.draw do

  get 'members/new'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :users
  resources :teams, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :challenges, only: [:index, :show] do
      resources :answers

    end
    post '/add_member', to: 'teams#add_member'
    get '/members/new', to: 'members#new'
  end
  resources :cities, only: [:index, :show]

end
