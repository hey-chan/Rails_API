class ParksController < ApplicationController
  before_action :set_park, only: [:show]

  # Show all parks available
  def index
    parks = Park.all.includes(:category, :feature, :address)
    render json: parks, include: { category: { only: :name }, feature: { only: :name } }, status: 200
  end

  # Show individual Park, based on params[:id]
  def show
    render json: @park, include: { category: { only: :name }, feature: { only: :name } }, status: 200
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
end
