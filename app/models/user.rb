class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :forums
  has_many :favorites
  has_many :post_comments
  has_many :forum_replies
  has_many :forum_favorites
  attachment :profile_image, destroy: false

  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower

  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following

  validates :account_name, length: {maximum: 20, minimum: 2}
  validates :profile, length: {maximum: 100}


  def followed_by?(user)
  passive_relationships.find_by(following_id: user.id).present?
  end

end
