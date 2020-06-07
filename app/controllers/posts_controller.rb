class PostsController < ApplicationController

  def new
    @post = Post.new
    @post.post_images.build
  end

  def index
    @post = Post.new
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    screen_user(@book)
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post
    else
      @posts = post.all
      render 'index'
    end
  end

  def update
    @post = Post.find(params[:id])
    if @book.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :strong, :part, post_images_images: [])
    end

    def screen_user(post)
      if post.user.id != current_user.id
        redirect_to posts_path
      end
    end

end
