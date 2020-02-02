class ForumsController < ApplicationController

	def index
		@forum_new = Forum.new
		@forums = Forum.all
		@forum_replies = ForumReply.all
		@user = current_user
	end

	def show
		@forums = Forum.find(params[:id])
		@user =  @forums.user
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
  	@forums_update = Forum.find(forum_params[:id])
  	if @forums_update.update(forum_params)
  		redirect_to forums_path
    else
     @forums = Forum.all
      render :index
     end
  end

	def destroy
		forum = Forum.find(params[:id])
		forum.destroy
		redirect_to forums_path
	end

	private
	def forum_params
		params.require(:forum).permit(:user_id, :forum_title, :forum_body, :forum_image, :forum_genre, :comments, :id)
	end
end