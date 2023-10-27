Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  resources :posts do 
    scope module: :posts do
      resources :comments, only: [:index]
    end
  end
  resources :comments do
    scope module: :comments do
      resources :nested_comments, only: [:index]
    end
  end
  root "posts#index"
end
