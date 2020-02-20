# frozen_string_literal: true

class ForumReply < ApplicationRecord
  belongs_to :user
  belongs_to :forum
  validates :comments, presence: true, length: { maximum: 200 }
  validates :comments, presence: { message: 'error' }
end
