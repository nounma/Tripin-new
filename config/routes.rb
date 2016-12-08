Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show, :edit, :update]
  resources :teams, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    get '/team_answers', to: 'teams#team_answers'
    resources :challenges, only: [:index, :show] do
      resources :answers
    end
    resources :members, only: [:new, :create, :destroy]
  end
  resources :cities, only: [:index, :show]

end
