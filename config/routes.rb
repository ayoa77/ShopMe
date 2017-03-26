Rails.application.routes.draw do
  get 'braintree/new'
  post 'braintree/checkout'

  resources :posts
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  resources :users
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  root 'welcome#home'
end
