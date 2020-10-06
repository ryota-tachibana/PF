Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get 'home/top' => 'homes#top'
get 'home/about' => 'homes#about'

resources :videos, only: [:new, :create, :show, :edit, :update, :destroy] do
get 'videos_movie' => 'videos#movie'
get 'drama_index' => 'drama#index'
get 'animation_index' => 'animation#index'
get 'another_index' => 'another#index'
resources :favorites, only: [:create, :destroy]
end
resources :users, only: [:show, :edit, :update]
resources :reviews, only: [:create, :edit, :update, :destroy]


end
