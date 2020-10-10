class Favorite < ApplicationRecord
 belongs_to :user
 belongs_to :video
 validates :user_id, uniqueness: { scope: :video_id } # 一意性を保つ。
end
