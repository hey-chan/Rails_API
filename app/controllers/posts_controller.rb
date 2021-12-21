class PostsController < ApplicationController
  # FOR COMMENTS
  before_action :set_park, only: [:show]

  # THIS SHOWS ALL COMMENTS FOR EVERY PARK. WE DON'T WANT THIS
  def index
    posts = Post.all
    render json: posts, include: { park: { only: :name }, user: { only: :username } }, status: 200
  end

  # PSEUDO CODE
  # Rendering comments that are ONLY for that particular park
  def show
    if @park.id == @post.park_id
      render json: posts, status: 200
    end
  end

  # private

  def set_park
    begin
      @park = Park.find(params[:id])
    rescue
      # Will run if exception is raised
      render json: { error: "Could not find this park" }, status: 404
    end
  end
end
