Todo::Application.routes.draw do
  root 'static_pages#home'
  match '/help', to: 'static_pages#help', via: 'get'
  match '/about', to: 'static_pages#about', via: 'get'
  match '/newtodo', to: 'todolists#new', via: 'get'
  match '/signin', to: 'users#new', via: 'get'
  resources :users
  resources :todolists

  get "static_pages/home"
  get "static_pages/help"
  get "static_pages/about"
  get "users/new"
end
