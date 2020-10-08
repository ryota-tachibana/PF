class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.save
    redirect_to request.referer
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def review_params
    params.require(:review).permit(:user_id, :video_id, :rating, :impression)
  end
  end
