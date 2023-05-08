Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/show'
  get 'users/show'
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'home#index'
  get 'user/:user_id', to: 'users#show', as: :user
  get 'user/:user_id/posts', to: 'posts#index', as: :user_posts
  get 'user/:user_id/posts/:id', to: 'posts#show', as: :user_post
end
