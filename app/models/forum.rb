# frozen_string_literal: true

class Forum < ApplicationRecord
  belongs_to :user
  has_many :forum_replies, dependent: :destroy
  has_many :forum_favorites, dependent: :destroy
  enum forum_genre: {
    Travel: 0, Tips: 1, Spot: 2, Trouble: 3
  }
  validates :forum_title, presence: true, length: { maximum: 50 }
  validates :forum_body, presence: true, length: { maximum: 200 }
  validates :forum_body, presence: { message: 'error' }

  def favorited_by?(user)
    forum_favorites.where(user_id: user.id).exists?
  end
end
