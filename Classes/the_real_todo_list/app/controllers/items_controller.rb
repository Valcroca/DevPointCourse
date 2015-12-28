class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])  
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to lists_path
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to lists_path(@item)
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
      redirect_to lists_path
    else
      redirect_to lists_path(item)
    end
  end

  private
    def item_params
      params.require(:item).permit(:name, :description, :priority, :completed)
    end
end
