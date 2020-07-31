Rails.application.routes.draw do
  resources :views
  get 'pages/more'
  get 'pages/my_posts', as: 'my_posts'
  get 'pages/my_favorites', as: 'my_favorites'
  get 'pages/notifications'
  get 'pages/how_it_works'
  post 'rreplies/report/:id', to: 'rreplies#report', as: 'rreplies_report'
  post 'replies/favorite/:id', to: 'replies#favorite', as: 'favorite_reply'
  post 'rreplies/favorite/:id', to: 'rreplies#favorite', as: 'favorite_rreply'
  resources :rreplies
  get 'users/profile'
  post 'posts/report/:id', to: 'posts#report', as: 'posts_report'
  post 'replies/report/:id', to: 'replies#report', as: 'replies_report'
  post 'posts/favorite/:id', to: 'posts#favorite', as: 'favorite'
  resources :replies
  resources :posts
  root 'demopages#home'
  get 'demopages/sign_up'
  get 'demopages/country_search'
  get 'demopages/country_page'
  get 'demopages/admin_dash'
  get 'demopages/country_index'
  get 'demopages/country_page_editor'
  namespace :admin do
      resources :users

      root to: "users#index"
    end
  post 'users/read_notification', to: 'users#read_notification', as: 'read_notification'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
