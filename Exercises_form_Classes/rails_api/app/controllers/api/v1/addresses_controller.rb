class Api::V1::AddressesController < ApplicationController
  before_action :check_params, only: [:create, :update]
  before_action :address, only: [:show, :update, :destroy]

  def show
    
  end

  def create
    
  end

  def update
    
  end

  def destroy
    
  end

  private

    def address
      @address = address.find_by(id: params[:id])
      unless @address
        render json: {errors: "address with id of #{params[:id]} could not be found. "}
      end
    end

    def check_params
      unless params.has_key?(:address)
        render json: {errors: 'address Params were not provided'}, status: 400
      end
    end

    def address_params
      params.require(:address).permit(:name, :date_built)
    end
end
