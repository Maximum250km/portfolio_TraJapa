# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  attachment :post_image, destroy: false
  validates :title, presence: true
  validates :title, presence: { message: 'error' }

  validates :body, presence: true, length: { maximum: 200 }
  validates :body, presence: { message: 'error' }
  enum post_genre: {
    Travel: 0, Tips: 1, Spot: 2
  }

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
