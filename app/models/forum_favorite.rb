class ForumFavorite < ApplicationRecord\
	belongs_to :user
	belongs_to :forum
end

def favorited_by?(user)
  forum_favorites.where(user_id: user.id).exists?
end