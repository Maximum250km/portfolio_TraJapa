class PostComment < ApplicationRecord
	belongs_to :user
	belongs_to :post
	validates :comments, presence: true, length: {maximum: 200}
end
