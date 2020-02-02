class ForumFavoritesController < ApplicationController

  def create
    @forum = Forum.find(params[:forum_id])
		favorite = current_user.forum_favorites.new(forum_id: @forum.id)
		favorite.save
  end

  def destroy
    @forum = Forum.find(params[:forum_id])
    favorite = current_user.forum_favorites.find_by(forum_id: @forum.id)
    favorite.destroy
  end
end