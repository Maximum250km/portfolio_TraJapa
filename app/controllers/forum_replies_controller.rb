# frozen_string_literal: true

class ForumRepliesController < ApplicationController
  def create
    @forum_new = Forum.new
    @forums = Forum.all
    @reply = ForumReply.new(forum_reply_params)
    @reply.user_id = current_user.id
    @reply.forum_id = params[:forum_id]
    # @forum_pages = Forum.page(params[:page]).reverse_order
    if @reply.save
      redirect_to forums_path
    else
      @forums = Forum.all
      @user = current_user
      render 'forums/index'
    end
  end

  def destroy
    @reply = ForumReply.find(params[:id])
    @reply.user_id = current_user.id
    @reply.destroy
    redirect_to forums_path, notice: 'your comment deleted '
  end

  private

  def forum_reply_params
    params.require(:forum_reply).permit(:comments)
  end
end
