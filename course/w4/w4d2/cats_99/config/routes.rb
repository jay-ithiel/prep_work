Rails.application.routes.draw do
  resources :cats, only: [:show, :index, :new, :edit, :create, :update]
  resources :cat_rental_requests, only: [:new, :create] do
    patch 'approve'
    delete 'deny'
  end
end
