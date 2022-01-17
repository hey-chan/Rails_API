class AddressesController < ApplicationController
  def index
    addresses = Address.all
    render json: addresses, status: 200
  end
end
