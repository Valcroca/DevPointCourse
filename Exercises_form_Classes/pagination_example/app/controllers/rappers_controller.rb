class RappersController < ApplicationController
  def index
    # Will Paginate example
    # @rappers = Rapper.paginate(:page => params[:page])

    @rappers = Rapper.page(params[:page])
  end
end
