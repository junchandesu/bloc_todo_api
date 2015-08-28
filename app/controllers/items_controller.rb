class ItemsController < ApplicationController
before_action :set_item, only: [:show, :update, :edit, :destroy]

  def show
  end

  def edit
  end

  def new
  	@item = Item.new
  end

  def update
  	  	
  	if @item.update(item_params)
  		flash[:notice] = "Todo item is updated."
  	else
  		flash[:error] = "Error saving the item."
  	end
  	redirect_to list_path(@list)
  end

  def create
  	@list = List.find(params[:list_id])
  	@item = @list.items.build(item_params)
  	if @item.save
  		flash[:notice] = "New Item is saved in the todo List."
  	else
  		flash[:error] = "Error saving the item."
  	end
  	redirect_to list_path(@list)
  end

  def destroy
  	if @item.destroy
  		flash[:notice] = "Item is deleted."
  	else
  		flash[:error] = "Error deleting the item."
  	end
  	redirect_to list_path(@list)
  end

  private

  def item_params
  	params.require(:item).permit(:todo, :memo, :complete)
  end

  def set_item
  	@list = List.find(params[:list_id])
  	@item = @list.items.find(params[:id])
  end
end
