class VideosController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :ensure_current_user, {only: [:edit,:update,:destroy]}
  def movie
    @videos = Video.where(category_id: "0").page(params[:page]).per(20)
    @category_name = "映画"
  end

  def drama
    @videos = Video.where(category_id: "1").page(params[:page]).per(20)
    @category_name = "ドラマ"
  end

  def animation
    @videos = Video.where(category_id: "2").page(params[:page]).per(20)
    @category_name = "アニメ"
  end

  def another
    @videos = Video.where(category_id: "3").page(params[:page]).per(20)
    @category_name = "その他"
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    @video.user_id = current_user.id
    if @video.save
       tags = Vision.get_image_data(@video.image)
       tags.each do |tag|
        @video.tags.create(name: tag)
    end
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
    if @video.update(video_params)
       tags = Vision.get_image_data(@video.image)
       tags.each do |tag|
        @video.tags.create(name: tag)
    end
    redirect_to video_path(@video)

    else
    render :edit
    end
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    redirect_to new_video_path
  end

  def genre_search
  @videos = Video.where(genre_id: params[:genre_name],category_id: params[:category_name]).page(params[:page]).per(20)
  @category_name = params[:category_name]
  end

  def video_search
    @model = params['search']['model']
    @content = params['search']['content']
    @method = params['search']['method']
    @result = video_search_for(@model, @content, @method)
  end

  def tag_search
    video_ids = Tag.where(name: params[:tag_name]).pluck(:video_id)
    @videos = Video.find(video_ids)
  end

  private
  def video_params
    params.require(:video).permit(:image, :category_id, :genre_id, :name, :summary)
  end

  def  ensure_current_user
       @video = Video.find(params[:id])
    if @video.user_id != current_user.id
       redirect_to video_path(@video)
    end
  end

  def video_search_for(model, content, method)
    if  model == 'video'
      if method == 'forward'
        Video.where('name LIKE ?', content + '%')
      elsif method == 'backward'
        Video.where('name LIKE ?', '%' + content)
      elsif method == 'perfect'
        Video.where(name: content)
      else
        Video.where('name LIKE ?', '%' + content + '%')
      end
    else
      [] # 空配列を返す
    end
  end
end
