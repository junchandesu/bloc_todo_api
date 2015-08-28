class ListsController < ApplicationController
before_action :set_list, only: [:show, :update, :edit, :destroy]


  def index
  	@lists = current_user.lists.all
  end

  def show
   
  end

  def edit

  end

  def update
    # I can change the condition backword to change the permissions at first
   if @list.update_ok?(@list.permissions) && @list.update(list_params)
      redirect_to lists_path, notice: "List is updated."
   else
  		redirect_to lists_path
  		flash[:error] = "List was not updated."
   end
  end

  def new
  	@list = List.new
  end

  def create
    @list = current_user.lists.build(list_params)
  	if @list.save
  		redirect_to lists_path, notice: "List is created."
  	else
  		render :edit
  		flash[:error] = "List was not updated."
  	end

  end

  def destroy
  	if @list.destroy
  		redirect_to lists_path, notice: "Llist is deleted."
  	else
  		redirect_to list_path(@list)
  		flash[:error] = "List was not deleted."
  	end
  end

  private

  def list_params
  	params.require(:list).permit(:permissions, :title)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
