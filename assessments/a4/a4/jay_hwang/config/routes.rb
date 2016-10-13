PostsApp::Application.routes.draw do
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :posts
  resources :tags, only: [:new, :create, :destroy]
end
