PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  get "/register", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  resources :users, only: [:create, :show, :edit, :update]

  resources :posts  do
    member do 
      post :vote
    end

    resources :comments, only: [:create, :destroy] do
      member do
        post "vote"
      end
    end
  end

  resources :categories, except: [:destroy, :edit]
end
