Rails.application.routes.draw do
  get 'users/profile'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root 'store#index', as: 'store_index'
  get '/u/:id', to: 'users#profile', as: 'user'
  resources :products do 
    resources :comments
  end   
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
