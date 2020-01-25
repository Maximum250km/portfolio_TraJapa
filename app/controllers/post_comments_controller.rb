class PostCommentsController < ApplicationController
	def create
		@post_comment = PostComment.new
		comment = PostComment.new(post_comments_params)
		comment.user_id = current_user.id
		comment.post_id = params[:post_id]
		comment.save
		@post = Post.find(params[:post_id])
	end

	def destroy
		comment = PostComment.find(params[:id])
		comment.user_id = current_user.id
		comment.destroy
		@post = Post.find(params[:post_id])
	end

	private
	def post_comments_params
		params.require(:post_comment).permit(:user_id,:comments,:post_id)
	end
end
	