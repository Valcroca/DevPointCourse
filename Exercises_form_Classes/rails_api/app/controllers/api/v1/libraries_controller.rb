class Api::V1::LibrariesController < ApplicationController
  before_action :check_params, only: [:create, :update]
  before_action :library, only: [:show, :update, :destroy]

  def index
    @libraries = Library.all
  end

  def show
    render :library
  end

  def create
    @library = Library.new(library_params)
    if @library.save
      render :library
    else
      render json: {errors: @library.error.full_messages.join(',')}
    end
  end

  def update
    if @library.update(library_params)
      render :library
    else
      render json: {errors: @library.errors.full_messages.join(',')}
    end
  end

  def destroy
    id = @library.id
    name = @library.name
    @library.destroy
    render json: {message: "Library with id of #{id} and name of #{name} was destroyed!"}
  end

  private

    def library
      @library = Library.find_by(id: params[:id])
      unless @library
        render json: {errors: "Library with id of #{params[:id]} could not be found. "}
      end
    end

    def check_params
      unless params.has_key?(:library)
        render json: {errors: 'Library Params were not provided'}, status: 400
      end
    end

    def library_params
      params.require(:library).permit(:name, :date_built)
    end
end
