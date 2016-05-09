class PostsController < ApplicationController

  #Before anything it is going to find the post
  before_action :find_post, only: [:show, :edit,:update,:destroy]
  def index
    @posts = Post.all.order("created_at desc")
  end

  #Creation of new posts inside form
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    #If the post saves correctly....
    if @post.save
      redirect_to @post, notice: "Congrats Darlan! Successfully saved :)"
    else
      render 'new', notice: "Oh No... Not able to save the article :("
    end
  end

  def show
  end

  def edit
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  def update
    if @post.update(post_params) #Just put the name of the method after the method of updating database, fo fill in the parameters
      redirect_to @post, notice:  "Article saved Buddy !"
    else
      render 'edit'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :slug)
  end

  def find_post
    @post = Post.friendly.find(params[:id])
  end


end
