Rails.application.routes.draw do
  root 'questions#index'

  resources :questions do
    resource :favorites, only: [:create, :destroy]
    resources :answers
  end

  resources :records

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/users/edit', to: 'users#edit', as: 'edit_user'
  patch '/users', to: 'users#update', as: 'user'

  get '/login', to: 'session#new'
  post '/login', to: 'session#create'
  get '/logout', to: 'session#destroy'
end
