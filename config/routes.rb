Rails.application.routes.draw do
  devise_for :admin, contollers: {
    registrations: 'admin/registrations',
    sessions: 'admin/sessions'
  }
  devise_for :users, controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }
  devise_scope :user do
    post 'public/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  root to: 'homes#top'
  get "/about", to: "homes#about"

  scope module: :public do
    get '/users/:id/quit', to: 'users#quit', as: "quit"
    patch '/users/:id/out', to: 'users#out', as: "out"
    get '/post/hashtag/:name', to: 'posts#hashtag'
    get '/post/hashtag', to: 'posts#hashtag'

    resources :users, except: [:new, :destroy] do
      get 'friends' => 'relationships#friends', as: 'friends'
      resource :relationships, only: [:create, :destroy]
      # いいねした投稿一覧表示
      member do
        get :favs
      end
    end
    resources :posts do
      resources :post_comments, only: [:create, :destroy]
      resource :favs, only: [:create, :destroy]
    end
    resources :rooms, only: [:create, :show, :index] do
      resources :messages, only: [:create, :destroy]
    end
    resources :notifications, only: [:index, :destroy]
  end

  namespace :admin do
    resources :posts, only: [:index, :show, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
