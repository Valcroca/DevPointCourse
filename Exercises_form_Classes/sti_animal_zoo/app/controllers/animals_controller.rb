class AnimalsController < ApplicationController
  include StiHelper

  before_action :zoo
  before_action :set_race
  before_action :animal, only: [:show, :edit, :update, :destroy]

  def index
    @animals = params[:type] ? @zoo.animals.where(race: race_class) : @zoo.animals.all
  end

  def show
  end

  def new
    @animal = race_class.new
  end

  def create
    @animal = @zoo.animals.new(animal_params)
    if @animal.save
      redirect_to sti_animal_path(@zoo)
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @animal.update(animal_params)
      redirect_to sti_animal_path(@zoo)
    else
      render :edit
    end
  end

  def destroy
    @animal.destroy
    redirect_to sti_animal_path(@zoo)
  end

  private
    def zoo
      @zoo = Zoo.find(params[:zoo_id])
    end

    def set_race
      @race = race
    end

    def animal
      @animal = race_class.find(params[:id])
    end

    def race_class
      race.constantize
    end

    def race
      Animal.races.include?(params[:type]) ? params[:type] : 'Animal'
    end

    def animal_params
      params.require(race.underscore.to_sym).permit(:name, :race, :age)
    end
end
