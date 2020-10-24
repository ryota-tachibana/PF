class ReviewsController < ApplicationController
  before_action :authenticate_user!
  def create
    @review = Review.new(review_params)
    @review.save
    redirect_to request.referer
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
  end

  private
  def review_params
    params.require(:review).permit(:id, :user_id, :video_id, :rating, :impression, :spoiler)
  end
end
