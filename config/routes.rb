Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :questions do
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
