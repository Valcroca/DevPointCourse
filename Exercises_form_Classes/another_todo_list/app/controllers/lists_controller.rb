class ListsController < ApplicationController

  def index
    render json: { lists: List.all }
  end
  
end
