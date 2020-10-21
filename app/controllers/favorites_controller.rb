class FavoritesController < ApplicationController
  before_action :authenticate_user!
  def create
    @video = Video.find(params[:video_id])
    favorite = @video.favorites.new(user_id: current_user.id)
    favorite.save
  end

  def destroy
    @video = Video.find(params[:video_id])
    @favorite = current_user.favorites.find_by(video_id: @video.id)
    @favorite.destroy
  end

  def destroy_mypage_favorite
    @video = Video.find(params[:video_id])
    @favorite = current_user.favorites.find_by(video_id: @video.id)
    @favorite.destroy
  end
end
