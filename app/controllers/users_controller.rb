class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :screen_user, only: [:edit, :update]

  def index

  end

  def show
  	@user = User.find(params[:id])
    @posts = @user.posts
    @post = Post.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def following
    #@userがフォローしているユーザー
    @user  = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end

  def followers
    #@userをフォローしているユーザー
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end

  def bookmark
    @user = User.find(params[:id])
    @posts = @user.posts
    @post = Post.new
  end

  private
	def user_params
	  params.require(:user).permit(:name, :introduction, :profile_image)
	end

  def screen_user
      unless params[:id].to_i == current_user.id
        redirect_to user_path(current_user)
      end
    end

end
