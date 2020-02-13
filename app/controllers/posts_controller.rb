class PostsController < ApplicationController

  def new
    @post_new = Post.new
    @user = current_user
  end

  def index
    @popular_posts = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id))
    @new_posts = Post.all.order(id: "DESC").limit(5)
    @user = current_user
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @post_comment = PostComment.new
  end

  def edit
    @post = Post.find(params[:id])
    @post_new = Post.new
    if current_user != @post.user
       redirect_to posts_path
    end
  end

  def create
    @post_new = Post.new(post_params)
    @post_new.user_id = current_user.id
    if @post_new.save
      redirect_to post_path(@post_new.id), notice: "successfully posted "
    else
     @posts= Post.all
     @user = current_user
     render :new
   end
 end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post),notice: "update completed !"
    else
      @post_new = @post
      @post = Post.find(params[:id])
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to user_path(current_user), notice: "your post was deleted"
  end


  private
  def post_params
    params.require(:post).permit(:title, :body, :post_image, :post_genre, :spot)
  end
end
