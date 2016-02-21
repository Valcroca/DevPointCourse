class SchoolsController < ApplicationController
  def index
    @schools = School.all
  end

  def show
    @school = School.find(params[:id])
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(params_id)
    if @school.save
      redirect_to 
    else
      render :new
    end
  end

  def edit
    @school = School.find(params[:id])

  end

  def update
    @school = School.find(params[:id])
    if @school.update
      redirect_to 
    else
      render :edit
    end
  end

  def destroy
    @school = School.find(params[:id])
    @school.destroy

  end

  private
    def school_params
      params.require(:school).permit(:created_at)
    end
end
