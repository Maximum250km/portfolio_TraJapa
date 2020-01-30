class ForumRepliesController < ApplicationController
	def create
		@reply = ForumReply.new(forum_reply_params)
		@reply.user_id = current_user.id
		@reply.forum_id = params[:forum_id]
		if @reply.save
			redirect_to forums_path
		end
	end

	def destroy
		@reply =  ForumReply.find(params[:id])
		@reply.user_id = current_user.id
		@reply.destroy
		 redirect_to forums_path
	end

	private
		def forum_reply_params
			params.require(:forum_reply).permit(:comments)
		end

end

