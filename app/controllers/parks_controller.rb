class ParksController < ApplicationController
  before_action :set_park, only: [:show, :update, :describe]
  before_action :authenticate, only: [:create, :update, :destroy]
  before_action :authorize, only: [:update, :destroy]

  # Show all parks available
  def index
    parks = Park.all.includes(:category, :feature)
    render json: parks, include: { category: { only: :name }, feature: { only: :name } }, status: 200
  end

  # Show individual Park, based on params[:id]
  def show
    render json: @park, include: { category: { only: :name }, feature: { only: :name } }, status: 200
  end

  ### THESE CRUD FEATURES HAVE NOT BEEN TESTED
  def create
    if current_user.admin == true
      park = current_user.parks.create(park_params)
      render_park(park)
    else
      render json: { error: "You are not authorised to do that" }, status: 404
    end
  end

  def update
    if current_user.admin == true
      @park.update(park_params)
      render_park(@park)
    end
  end

  def destroy
    if current_user.admin == true
      attributes = @park.attributes
      @park.destroy
      render json: attributes, status: 202
    end
  end

  private

  def set_park
    begin
      @park = Park.find(params[:id])
    rescue
      # Will run if exception is raised
      render json: { error: "Could not find this park" }, status: 404
    end
  end

  def park_params
    params.require(:park).permit(:name, :latitude, :longitude, :category_id, :feature_id, :address_id, :cheese, :wine)
  end

  def authorize
    # Permission for user to edit/update post
    render json: { error: "You do not have permission to do that" }, status: 401 unless current_user.admin == true
  end

  def render_park(park)
    unless park.errors.any?
      render json: park, include: { park: { only: :name }, user: { only: :username } }, status: 201
    else
      render json: { errors: park.errors.full_messages }, status: 422
    end
  end
end
