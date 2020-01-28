class ForumsController < ApplicationController

	def index
		@forum_new = Forum.new
		@forums = Forum.all
		@forum_replies = ForumReply.all
	end

	def show
		@forums = Forum.find(params[:id])
		@user =  @forums.user
	end

	def edit
		@forums = Forum.find(params[:id])
	end

	def create
		@forum_new = Forum.new(forum_params)
		@forum_new.user_id = current_user.id
		if @forum_new.save
			redirect_to forums_path, notice: "successfully posted "
		else
			@forums= Forum.all
			@user = current_user
			render 'forum'
		end
	end

	def destroy
		forum = Forum.find(params[:id])
		forum.destroy
		redirect_to forums_path, notice: "your post was deleted"
	end

	private
	def forum_params
		params.require(:forum).permit(:user_id, :forum_title, :forum_body, :forum_image, :forum_genre, :comments, :forum_id)
	end
end