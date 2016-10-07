Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]

  resources :bands, only: [:index, :new, :create, :edit, :update, :show, :destroy] do
    resources :albums, only: [:new]
  end

  resources :albums, only: [:create, :edit, :update, :show, :destroy] do
    resources :tracks, only: [:new]
  end

  resources :tracks, only: [:create, :edit, :show, :update, :destroy]
end
