class UsersController < ApplicationController
  def show
  @user = User.find(params[:id])
  @video = Video.find(params[:id])
  @favorites = Favorite.where(user_id: current_user.id).all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	redirect_to user_path(@user)
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :profile_image)
  end

end
