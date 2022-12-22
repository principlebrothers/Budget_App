Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, sign_out_via: [:get, :post]

  # resources :users, only: [:show]
end
