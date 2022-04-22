class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  # GET /posts
  def index
    limit = params[:limit] ? params[:limit] : 5
    offset = params[:offset] ? params[:offset] : 0

    @posts = Post.left_joins(:ratings).joins(:user).select("posts.id,title,content,user_id,posts.created_at,AVG(IFNULL(star,0)) as rating,username as author").group("posts.id").limit(limit).offset(offset)
    #@posts = Post.joins(:rating).all

    render json: @posts
  end

  # GET /posts/1
  def show
    render json: @post
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    @post.author_ip = request.remote_ip
    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.permit(:title, :content, :author_ip, :user_id)
    end
end
