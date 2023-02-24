Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "lists#index"
  resources :lists do
    resources :bookmarks, only: %i[create index]
  end
  resources :bookmarks, only: %i[destroy]

end
