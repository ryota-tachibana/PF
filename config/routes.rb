Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get 'home/about' => 'homes#about'

resources :videos, only: [:new, :create, :show, :edit, :update, :destroy] do
get 'videos/movie_index' => 'videos#movie_index'
get 'videos/drama_index' => 'videos#drama_index'
get 'videos/animation_index' => 'videos#animation_index'
resources :favorites, only: [:create, :destroy]
end
resources :users, only: [:show, :edit, :update]
resources :reviews, only: [:create, :edit, :update, :destroy]


end
