Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, sign_out_via: [:get, :post]

  resources :groups, except: [:edit, :update, :destroy] do
    resources :accounts, only: [:index, :new, :create]
  end
end
