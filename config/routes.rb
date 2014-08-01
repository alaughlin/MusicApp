Rails.application.routes.draw do
  resources :users, only: [:new, :create, :update, :destroy, :show]
  resource :session, only: [:new, :create, :destroy]
end
