class AddressesController < ApplicationController
  before_action :authenticate, only: [:create, :update, :destroy]
  before_action :authorize, only: [:update, :destroy]

  def index
    addresses = Address.includes(:park).where("park_id = #{params[:park_id]}", "example").references(:park)
    render json: addresses, status: 200
  end

  def create
    address = Address.create(address_params.to_h.merge(park_id: params[:park_id]))
    render_address(address)
  end

  def update
    @address = Address.find(params[:park_id])
    @address.update(address_params)
    render_address(@address)
  end

  private

  # def set_park
  #   begin
  #     # @post = Post.find(params[:park_id])
  #     @park = Park.find(params[:park_id])
  #   rescue
  #     # Will run if exception is raised
  #     render json: { error: "Could not find this park and its address" }, status: 404
  #   end
  # end

  def authorize
    begin
      @address = Address.find(params[:park_id])
    rescue
      render json: { error: "Could not find this address" }, status: 404
    end
    render json: { error: "You do not have permission to do that" }, status: 401 unless current_user.id == 1
  end

  # def set_address
  #   begin
  #     @address = Address.find(params[:id])
  #   rescue
  #     # Will run if exception is raised
  #     render json: { error: "Could not find this address for this park" }, status: 404
  #   end
  # end

  def address_params
    params.require(:address).permit(:number, :street, :suburb, :postcode, :park_id)
  end

  def render_address(address)
    unless address.errors.any?
      render json: address, status: 201
    else
      render json: { errors: address.errors.full_messages }, status: 422
    end
  end
end
