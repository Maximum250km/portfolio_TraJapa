class ForumsController < ApplicationController
	before_action :set_forum

	def index
		@forum_new = Forum.new
		@forums = Forum.all
		@forum_replies = ForumReply.all
		@user = current_user
		@forum_pages = Forum.page(params[:page]).reverse_order
	end

	def create
		@forum_new = Forum.new(forum_params)
		@forum_new.user_id = current_user.id
		if @forum_new.save
			redirect_to forums_path
		else
			@forums= Forum.all
			@user = current_user
			render 'index'
		end
	end

  def update
  	@forums_update = Forum.find(params[:id])
  	if @forums_update.update(forum_params)
  		redirect_to forums_path
    else
     @forums = Forum.all
      render 'index'
    end
  end

	def destroy
		forum = Forum.find(params[:id])
		forum.destroy
		redirect_to forums_path
	end

	private
	def forum_params
		params.require(:forum).permit(:user_id, :forum_title, :forum_body, :forum_genre, :comments, :id)
	end

	def set_forum
	  @forum_new = Forum.new
	  # index内にて投稿/編集を行うため、必要な措置（renderの際に@forum_new = Forum.newがないとエラーが発生する。）
	end
end