Todo::Application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  root 'static_pages#home'
  match '/help', to: 'static_pages#help', via: 'get'
  match '/about', to: 'static_pages#about', via: 'get'
  match '/newtodo', to: 'todolists#new', via: 'get'
  match '/yourtodo', to: 'todolists#index', via: 'get'
  match '/todocal', to: 'todolists#todocal', via: 'get'
  match '/signup', to: 'users#new', via: 'get'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
  resources :todolists


  get "static_pages/home"
  get "static_pages/help"
  get "static_pages/about"
  get "users/new"
end
