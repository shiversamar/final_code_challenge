class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]



  def index
    @posts = Post.all.order("created_at DESC")
  end

  def show
  end

  # build post to current_user that associated

  def new
    @post = Post.new(post_params)
  end


  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render 'new'
    end
  end


  def edit
  end


  def update
    if @post.update(post_params)
      redirect_to post_path
    else
      render 'new'
    end
  end


  def destroy
  @post.destroy
  redirect_to root_path
  end




  private
      # Never trust parameters from the scary internet, only allow the white list through.
      def post_params
        params.require(:post).permit(:title, :body)
      end

      # Use callbacks to share common setup or constraints between actions.
      def find_post
        @post = Post.find(params[:id])
      end

end
