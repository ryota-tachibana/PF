class VideosController < ApplicationController

  def movie
    @videos = Video.where(category_id: "0")
    @category_name = "映画"
  end

  def drama
    @videos = Video.where(category_id: "1")
    @category_name = "ドラマ"
  end

  def animation
    @videos = Video.where(category_id: "2")
    @category_name = "アニメ"
  end

  def another
    @videos = Video.where(category_id: "3")
    @category_name = "その他"
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    @video.user_id = current_user.id
    if
    @video.save
    redirect_to video_path(@video.id)
    else
      render :new
    end
  end

  def show
    @video = Video.find(params[:id])
    @user = current_user
    @review = Review.new
    @reviews = @video.reviews
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

  def genre_search
  @videos = Video.where(genre_id: params[:genre_name],category_id: params[:category_name])
  @category_name = params[:category_name]
  end

  private
  def video_params
    params.require(:video).permit(:image, :category_id, :genre_id, :name, :summary)
  end
end
