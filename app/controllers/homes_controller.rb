class HomesController < ApplicationController
  def top
    @rankings = Video.find(Review.group(:video_id).order('avg(rating) desc').limit(10).pluck(:video_id))
  end

  def about
  end

end
