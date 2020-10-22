class VideosController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def movie
    @videos = Video.where(category_id: "0").page(params[:page]).per(24)
    @category_name = "映画"
  end

  def drama
    @videos = Video.where(category_id: "1").page(params[:page]).per(24)
    @category_name = "ドラマ"
  end

  def animation
    @videos = Video.where(category_id: "2").page(params[:page]).per(24)
    @category_name = "アニメ"
  end

  def another
    @videos = Video.where(category_id: "3").page(params[:page]).per(24)
    @category_name = "その他"
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    @video.user_id = current_user.id
    if @video.save
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
    if @video = Video.find(params[:id])
    @video.update(video_params)
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
  @videos = Video.where(genre_id: params[:genre_name],category_id: params[:category_name])
  @category_name = params[:category_name]
  end

  def video_search
    @model = params['search']['model']
    @content = params['search']['content']
    @method = params['search']['method']
    @result = video_search_for(@model, @content, @method)
  end

  private
  def video_params
    params.require(:video).permit(:image, :category_id, :genre_id, :name, :summary)
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
