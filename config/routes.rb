Rails.application.routes.draw do

  resources :articles
  root 'articles#index'

  get '/signup' => 'users#new'
  resources :users

  get '/login' => 'session#new'
  post 'login' => 'session#create'
  delete 'logout' => 'session#destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
