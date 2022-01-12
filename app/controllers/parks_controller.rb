class ParksController < ApplicationController
  before_action :set_park, only: [:show, :update, :destroy]
  before_action :authenticate, only: [:create, :update, :destroy]
  before_action :authorize, only: [:create, :update, :destroy]

  # Show all parks available
  def index
    parks = Park.all.includes(:category, :feature)
    render json: parks, include: { category: { only: :name }, feature: { only: :name }, address: { only: [:number, :street, :suburb, :postcode] } }, status: 200
    # render json: parks, include: ["category", "feature", "address"], status: 200
  end

  # Show individual Park, based on params[:id]
  def show
    render json: @park, include: { category: { only: :name }, feature: { only: :name }, address: { only: [:number, :street, :suburb, :postcode] } }, status: 200
  end

  ### THESE CRUD FEATURES HAVE NOT BEEN TESTED
  def create
    park = current_user.parks.create(park_params)
    render_park(park)
  end

  def update
    @park.update(park_params)
    render_park(@park)
  end

  def destroy
    attributes = @park.attributes
    @park.destroy
    render json: attributes, status: 202
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
    params.require(:park).permit(:name, :latitude, :longitude, :category_id, :feature_id, :address_id, :user_id, :cheese, :wine, :picture)
  end

  def authorize
    # Permission for user to edit/update post
    render json: { error: "You do not have permission to do that" }, status: 401 unless current_user.id == 1
  end

  def render_park(park)
    unless park.errors.any?
      render json: park, include: { category: { only: :name }, feature: { only: :name } }, status: 201
    else
      render json: { errors: park.errors.full_messages }, status: 422
    end
  end
end
