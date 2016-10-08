Rails.application.routes.draw do
  root to: "subs#index"

  resources :users, only: [:create, :new, :show]

  resource :session, only: [:create, :new, :destroy]

  resources :subs, except: :destroy do
    resources :posts, only: [:create, :new]
  end

  resources :posts, except: [:create, :new, :index] do
    resources :comments, only: :new
  end

  resources :comments, only: [:create, :show]
end
