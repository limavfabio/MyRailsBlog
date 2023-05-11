Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'users#index'

  resources :users do
    resources :posts do
      post 'create_comment', on: :member
    end
  end
end
