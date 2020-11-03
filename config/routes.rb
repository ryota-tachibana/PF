Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  get 'genre_search' => 'videos#genre_search' #ジャンル検索
  get 'video_search' => 'videos#video_search' #作品名検索
  get 'tag_search' => 'videos#tag_search' #タグ検索
  resources :videos, only: [:new, :create, :show, :edit, :update, :destroy] do
    get 'videos_movie' => 'videos#movie'
    get 'videos_drama' => 'videos#drama'
    get 'videos_animation' => 'videos#animation'
    get 'videos_another' => 'videos#another'
    resource :favorites, only: [:create, :destroy] do
      delete :destroy_mypage_favorite, on: :member
    end
  end
resources :users, only: [:show, :edit, :update]
resources :reviews, only: [:create, :destroy]


end
