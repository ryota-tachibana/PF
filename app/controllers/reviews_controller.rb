class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    if @review.save
    redirect_to request.referer
    else
    render 'homes/about'
    end

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def review_params
    params.require(:review).permit(:id, :user_id, :video_id, :rating, :impression)
  end
  end
