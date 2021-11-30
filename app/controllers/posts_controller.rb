class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :authenticate_user!,only: [:new,:update,:edit,:destroy]
  before_action :same_user, only: [ :edit, :update, :destroy ]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  
  
  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result.includes(:user)
  end


  def comments
    @post = Post.find(params[:id])
    @comments = @post.comments
  end
  
  def show
    @comment = Comment.new
    @comments = @post.comments.all
  end


  def new
    @post = Post.new
    @categorizes = Categorize.all
  end

  
  def edit
    @categorizes = Categorize.all
  end

  
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if params[:_destroy] == true
        @post.categorizes
      end
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :description,:user_id,categorizes_attributes: [:id,:category_id,:categorizable_type,:categorizable_id,:_destroy])
    end

    def same_user
      unless current_user.id == @post.user.id
        redirect_to posts_path
      end
    end
    def record_not_found
      render plain: "404 Not Found", status: 404
    end
    
    
end
