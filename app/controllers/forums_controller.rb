class ForumsController < ApplicationController

	def index
		@forums = Forum.all
		@user = current_user
		@forum_new = Forum.new
	end

	def create
		@forum_new = Froum.new(forum_params)
		@forum_new.user_id = current_user.id
		if @forum_new.save
			redirect_to forums_path, notice: "successfully posted "
		else
			@forum= Forum.all
			@user = current_user
			render 'index'
		end
	end
end

def destroy
	forum = Forum.find(params[:id])
	forum.destroy
	redirect_to forums_path, notice: "your post was deleted"
end

private
def forums_params
	params.require(:forum).permit(:user_id,:forum_title,:forum_body,:forum_image,:forum_genre)
end
end