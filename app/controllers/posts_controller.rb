class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]


  def index
    @posts = Post.all.order("created_at DESC").paginate(page:params[:page],per_page:5)

    @user = User.find_by_id(params[:id])
    # @user = current_user.posts.build(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end


  # incrementing the database for new Post new cause i've started with out Author (user_id)

  def new
    @post = Post.new(post_params)
    @post = current_user.posts.build
  end



  def create
    @post = Post.new(post_params)
    if @post = current_user.posts.build(post_params)
    elsif @post.save
      redirect_to root_path
    else
      render 'new'
    end
  end


  def edit
    @post = Post.find(params[:id])
  end


  def update
    if @post.update(params[:post].permit(:title, :body))
      redirect_to post_path
    else
      render 'new'
    end
  end


  def destroy
    @post = Post.find(params[:id])
		@post.destroy
    redirect_to root_path
  end




  private
      # Never trust parameters from the scary internet, only allow the white list through.
      def post_params
        params.require(:post).permit(:title, :body, :first_name, :last_name, :email)
      end

      # Use callbacks to share common setup or constraints between actions.
      def find_post
        @post = Post.find(params[:id])
      end

end
