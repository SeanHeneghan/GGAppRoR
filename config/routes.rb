Rails.application.routes.draw do
  Rails.application.routes.default_url_options[:host] = 'localhost:3000'
  resources :posts
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  authenticated :user do
    root to: 'home#index', as: 'home'
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  unauthenticated :user do
    root 'home#front'
  end
end
