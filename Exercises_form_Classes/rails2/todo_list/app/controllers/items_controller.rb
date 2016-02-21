class ItemsController < ApplicationController
  def index
    #GET
    #shows all the items
    @items = Item.all
  end

  def show
    ##GET
    #showing a single item
    @item = Item.find(params[:id])
  end

  def new
    #GET
    #rendering the form to create a new item
    @item = Item.new
  end

  def create
    #POST
    #creating the item and redirecting the user
    @item = Item.new(item_params)
    if @item.save
      #redirect back to the index page
      redirect_to items_path
    else
      #render the new form again and show users errors
      render :new
    end
  end

  def edit
    #GET
    #rendering the form so we can edit a single item
    @item = Item.find(params[:id])
  end

  def update
    #PUT
    #updating the item and redirecting the user
    @item = Item.find(params[:id])
    if @item.update(item_params)
      #redirect to the show page
      redirect_to item_path(@item)
    else
      #TODO: show errors to the user
      render :edit
    end
  end

  def destroy
    #DELETE
    #finding the item and removing it from our database
    item = Item.find(params[:id])
    if item.destroy
      # TODO: put a flash message for a better user experience
      #redirect back to the index page
      redirect_to items_path
    else
      #TODO: show an error flash message
      #redirect back to show page
      redirect_to item_path(item)
    end
  end

  private
    def item_params
      params.require(:item).permit(:name, :description, :completed)
    end

end
