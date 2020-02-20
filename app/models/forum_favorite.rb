# frozen_string_literal: true

class ForumFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :forum
end
