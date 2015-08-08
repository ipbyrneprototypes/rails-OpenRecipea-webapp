Rails.application.routes.draw do
  

    devise_for :users
  resources :users, only: [:show, :index] do
      collection do
        get 'search'
      end
      member do
        get "like", to: "users#upvote"
        get "dislike", to: "users#downvote"
      end
    end
  
    resources :recipes do
      collection do
        get 'search'
      end
      member do
        get "like", to: "recipes#upvote"
        get "dislike", to: "recipes#downvote"
      end
        resources :reviews, except: [:show, :index]
    end
  
  resources :followers, only: [:show, :index] do
      collection do
        get 'search'
      end
      member do
        get "like", to: "users#upvote"
        get "dislike", to: "users#downvote"
      end
    end
  
    resources :followings, only: [:show, :index] do
      collection do
        get 'search'
      end
      member do
        get "like", to: "users#upvote"
        get "dislike", to: "users#downvote"
      end
    end
  
    
    get 'welcome/index'
  
  authenticated :user do
    root "recipes#index", as: "authenticated_root"
  end
  
  root "welcome#index"
end
