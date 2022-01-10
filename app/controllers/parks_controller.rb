class ParksController < ApplicationController
  before_action :set_park, only: [:show]
  before_action :authenticate, only: [:create, :update, :destroy]

  # Show all parks available
  def index
    parks = Park.all.includes(:category, :feature)
    render json: parks, include: { category: { only: :name }, feature: { only: :name } }, status: 200
  end

  # Show individual Park, based on params[:id]
  def show
    render json: @park, include: { category: { only: :name }, feature: { only: :name } }, status: 200
  end

  def create
    park = current_user.parks.create(park_params)
    unless park.errors.any?
      render json: park, include: { category: { only: :name }, feature: { only: :name } }, status: 201
    else
      render json: { errors: park.errors.full_messages }, status: 422
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
end
