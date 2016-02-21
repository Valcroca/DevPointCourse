class ZoosController < ApplicationController
  before_action :find_params, only: [:show, :edit, :destroy, :update]
  
  def index
    @zoos = Zoo.all
  end

  def show
  end

  def new
    @zoo = Zoo.new
  end

  def create
    @zoo = Zoo.new(zoo_params)
    if @zoo.save
      redirect_to zoos_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @zoo.update(zoo_params)
      redirect_to zoo_path(@zoo)
    else
      render :edit
    end
  end

  def destroy
    @zoo.destroy
    redirect_to zoos_path
  end

  private
    def zoo_params
      params.require(:zoo).permit(:name)
    end

    def find_params
      @zoo = Zoo.find(params[:id])
    end
end