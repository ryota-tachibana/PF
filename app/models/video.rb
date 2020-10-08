class Video < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :favorites
  enum genre_id: {アクション:0, 冒険:1, コメディ:2, ミステリー:3, ヒューマン:4, SF:5, ファンタジー:6, ホラー:7, 犯罪:8, それ以外のジャンル:9}
  enum category_id: {映画:0, ドラマ:1, アニメ:2, それ以外のカテゴリー:3}
  attachment :image
  validates :genre_id, presence:true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
