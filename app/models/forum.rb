class Forum < ApplicationRecord
	belongs_to :user
	has_many :forum_replies
	has_many :forum_favorites
	attachment :forum_image, destroy: false
	enum forum_genre: {
		Travel: 0,Tips: 1,Spot: 2,Trouble: 3
	}

end