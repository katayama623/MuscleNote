class PostsController < ApplicationController
  before_action :authenticate_user!,only: [:create,:edit,:update,:destroy,:index]

  def new
    @post = Post.new
    @post.post_images.build
  end

  def index
    @post = Post.new
    @posts = Post.all.page(params[:page]).per(10)
    @user = @post.user
    @all_ranks = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
    if params[:tag_name]
      @posts = Post.tagged_with("#{params[:tag_name]}")
      @posts = @posts.page(params[:page]).per(10)
    end
  end

  def show
    @post = Post.find(params[:id])
    @book = Book.new
    @post_comment = PostComment.new
    #新着順で表示
    @post_comments = @post.post_comments.order(created_at: :desc)
  end

  def edit
    @post = Post.find(params[:id])
    screen_user(@post)
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post
    else
      @posts = Post.all
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
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

  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @posts = Post.search(params[:search])
    @posts = @posts.page(params[:page]).per(10)
    @search = params[:search]
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :strong, :part, :start_image, :finish_image, :tag_list, post_images_images: [])
    end

    def screen_user(post)
      if post.user.id != current_user.id
        redirect_to posts_path
      end
    end

end
