class Favorite < ApplicationRecord
	belongs_to :post
	belongs_to :user
end

def favorited_by?(user)
	favorites.where(user_id: user.id).exists?
end

