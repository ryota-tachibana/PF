class VideosController < ApplicationController

  def movie
    @videos = Video.where(category_id: "0")
  end

  def drama_index
  end

  def animation_index
  end

  def another_index
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    if
    @video.save
    redirect_to video_path(@video.id)
    else
      render :new
    end
  end

  def show
    @video = Video.find(params[:id])
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])
    @video.update(video_params)
    redirect_to video_path(@video)
  end

  def destroy
  end

  private
  def video_params
    params.require(:video).permit(:image, :category_id, :genre_id, :name, :summary)
  end
end
