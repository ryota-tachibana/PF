class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.save
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
  end

  private
  def review_params
    params.require(:review).permit(:id, :user_id, :video_id, :rating, :impression)
  end
  end
