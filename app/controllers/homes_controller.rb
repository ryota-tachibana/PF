class HomesController < ApplicationController
  def top
    @rankings = Video.find(Review.group(:video_id).order('avg(rating) desc').limit(5).pluck(:video_id))
    @favorite_rankings = Video.find(Favorite.group(:video_id).order('count(video_id) desc').limit(5).pluck(:video_id))
  end

  def about
  end

end
