Todo::Application.routes.draw do
  resources :users
  resources :todolists

  get "static_pages/home"
  get "static_pages/help"
  get "static_pages/about"
  get "users/new"
end
