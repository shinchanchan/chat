Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "sessions#new"
  post "sessions/new"
  get "chatroom/index"
  post "chatroom/index"
  get "sessions/create"
  post "sessions/create"
  get "sessions/logout"
  post "sessions/logout"
  get "chatroom/chat"
  post "chatroom/chat"
  get "sessions/signup"
  post "sessions/signup"

  mount ActionCable.server => '/cable'


end
