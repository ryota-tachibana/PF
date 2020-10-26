class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_current_user
  def show
  @user = User.find(params[:id])
  @video = Video.find(params[:id])
  @favorites = Favorite.where(user_id: current_user.id).all.page(params[:page]).per(18)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  	redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :profile_image)
  end

  def  ensure_current_user
       @user = User.find(params[:id])
    if @user.id != current_user.id
     redirect_to user_path(current_user.id)
   end
  end

end
