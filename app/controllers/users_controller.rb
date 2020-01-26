class UsersController < ApplicationController
  before_action :baria_user, only: [:update]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def index
    @users = User.all
    @user = current_user
  end


  def edit
    @user = User.find(params[:id])
      if current_user != @user
      redirect_to user_path(current_user)
      end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "successfully updated user!"
    else
      flash[:message] = ' error ! can not be blank '
      render "edit"
    end
  end

  private
  def user_params
    params.require(:user).permit(:account_name, :profile, :profile_image, :nationality)
  end

  #url直接防止　メソッドを自己定義してbefore_actionで発動。
   def baria_user
    unless params[:id].to_i == current_user.id
      redirect_to user_path(current_user)
    end
   end

end