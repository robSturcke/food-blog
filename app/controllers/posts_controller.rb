class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save

    redirect_to @post
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.assign_attributes(post_params)
    authorize @post

    if @post.save
      flash[:notice] = "\"#{@post.title}\" has been updated!"
      redirect_to @post
    else
      flash[:error] = "There was a stupid error saving it. Try again."
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    authorize @post
    if @post.destroy
      flash[:notice] = "\"#{@post.title}\" was deleted successfully."
      redirect_to posts_path
    else
      flash[:error] = "There was an error deleting the post."
      render :show
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
