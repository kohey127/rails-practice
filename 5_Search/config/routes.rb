Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'follows' => 'relationships#follower', as: 'follows'
    get 'followers' => 'relationships#followed', as: 'followers'
  end

  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  get 'search' =>


  # post 'follow/:id' => 'relationships#create', as: 'follow' # フォローする
  # delete 'unfollow/:id' => 'relationships#destroy', as: 'unfollow' # フォロー外す
  # get ':user_id/follows' => 'relationships#follows', as: 'follows' # フォロー一覧取得
  # get ':user_id/followers' => 'relationships#followers', as: 'followers' # フォロワー一覧取得
  
  root 'home#top'
  get 'home/about'
end