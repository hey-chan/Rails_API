class PostsController < ApplicationController
  # FOR COMMENTS
  # before_action :set_park, only: [:index, :update, :describe]
  before_action :authenticate, only: [:create, :update, :destroy]
  before_action :authorize, only: [:update, :destroy]
  # before_action :set_comment, only: [:show]

  # THIS SHOWS ALL COMMENTS FOR EVERY PARK. WE DON'T WANT THIS
  # Ideally, we need this to render comments that are associated with that id
  def index
    # posts = Post.all.includes(:park, :user)
    posts = Post.includes(:park).where("park_id = #{params[:park_id]}", "example").references(:park)
    # if park_id == @park
    #   render json: posts, include: { park: { only: :name }, user: { only: :username } }, status: 200
    #   puts "This comment exists"
    # end
    render json: posts, include: { park: { only: :name }, user: { only: :username } }, status: 200
  end

  ## RENDER ONE COMMENT (for testing purposes)
  def show
    begin
      @post = Post.find(params[:id])
      render json: @post, include: { park: { only: :name }, user: { only: :username } }, status: 200
    rescue
      # Will run if exception is raised
      render json: { error: "Could not find this comment" }, status: 404
    end
  end

  def create
    post = current_user.posts.create(post_params.to_h.merge(park_id: params[:park_id]))
    render_post(post)
  end

  ### ABILITY TO UPDATE A COMMENT
  def update
    # @post.update(post_params)
    # render_post(@post)
    begin
      @post = Post.find(params[:id])
      @post.update(post_params)
      render json: @post, include: { park: { only: :name }, user: { only: :username } }, status: 200
    rescue
      # Will run if exception is raised
      render json: { error: "Could not find this comment" }, status: 404
    end
  end

  ### ABILITY TO DELETE A COMMENT
  def destroy
    begin
      @post = Post.find(params[:id])
      @post.destroy
    rescue
      # Will run if exception is raised
      render json: { error: "Could not find this comment" }, status: 404
    end
  end

  # PSEUDO CODE
  # Rendering comments that are ONLY for that particular park

  private

  def set_park
    begin
      # @post = Post.find(params[:park_id])
      @park = Park.find(params[:park_id])
    rescue
      # Will run if exception is raised
      render json: { error: "Could not find this park" }, status: 404
    end
  end

  def set_comment
    begin
      @post = Post.find(params[:id])
    rescue
      # Will run if exception is raised
      render json: { error: "Could not find this comment" }, status: 404
    end
  end

  def post_params
    params.require(:post).permit(:id, :user_id, :park_id, :comment, :rating)
  end

  def authorize
    # Permission for user to edit/update post
    begin
      @post = Post.find(params[:id])
    rescue
      # Will run if exception is raised
      render json: { error: "Could not find this comment" }, status: 404
    end
    render json: { error: "You do not have permission to do that" }, status: 401 unless current_user.id == 1 || current_user.id == @post.user_id
    # current_user.id == @post.user_id ||
  end

  def render_post(post)
    unless post.errors.any?
      render json: post, include: { park: { only: :name }, user: { only: :username } }, status: 201
    else
      render json: { errors: post.errors.full_messages }, status: 422
    end
  end

  # def set_comment
  #   begin
  #     @post = Post.find(params[:park_id])
  #   rescue
  #     # Will run if exception is raised
  #     render json: { error: "Could not find this comment" }, status: 404
  #   end
  # end
end
