class Api::ListsController < ApiController
   before_action :authenticated?

   def index
   	lists = List.all
   	render json: lists, each_serializer: ListSerializer
   end
 
   def create
   	user = User.find(params[:user_id])
   	list = user.lists.build(list_params)
   	if list.save
   		render json: list, each_serializer: ListSerializer
   	else
   		render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
   	end
   end
 	
 	def update
 		list = List.find(params[:id])
 		if list.update(list_params)
 			render json: list
 		else
 			render json: { error: list.errors.full_message }, status: :unprocessable_entity
 		end
 	end

 	private
    def list_params
   	    params.require(:list).permit(:title)
    end
 end

    	
