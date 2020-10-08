class FavoritesController < ApplicationController
  def create
    @video = Video.find(params[:video_id])
    favorite = @video.favorites.new(user_id: current_user.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    @video = Video.find(params[:video_id])
    favorite = current_user.favorites.find_by(video_id: @video.id)
    favorite.destroy
    redirect_to request.referer
  end
end
