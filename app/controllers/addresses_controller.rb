class AddressesController < ApplicationController
  def index
    addresses = Address.includes(:park).where("park_id = #{params[:park_id]}", "example").references(:park)
    render json: addresses, status: 200
  end

  def create
    address = Address.create(post_params.to_h.merge(park_id: params[:park_id]))
    render_post(address)
  end

  def update
    @address = Address.find(params[:id])
    @address.update(post_params)
  end

  private

  def set_park
    begin
      # @post = Post.find(params[:park_id])
      @park = Park.find(params[:park_id])
    rescue
      # Will run if exception is raised
      render json: { error: "Could not find this park and its address" }, status: 404
    end
  end

  def authorize
    begin
      @address = Address.find(params[:id])
    rescue
      render json: { error: "Could not find this address" }, status: 404
    end
  end

  def set_address
    begin
      @address = Address.find(params[:id])
    rescue
      # Will run if exception is raised
      render json: { error: "Could not find this address for this park" }, status: 404
    end
  end

  def address_params
    params.require(:address).permit(:id, :park_id, :number, :street, :suburb, :postcode)
  end

  def render_address(address)
    unless address.errors.any?
      render json: address, status: 201
    else
      render json: { errors: address.errors.full_messages }, status: 422
    end
  end
end
