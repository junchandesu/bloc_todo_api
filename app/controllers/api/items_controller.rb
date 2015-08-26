class Api::ItemsController < ApiController
   before_action :authenticated?

   def index
   	items = Item.all
   end

   def create
   	 list = List.find(params[:list_id])
   	 item = list.items.build(item_params)
   	 if item.save
   		render json: item, each_serializer: ItemSerializer
   	 else
   		render json: { errors: item.errors.full_messages}, status: :unprocessable_entity
     end
    end

    private

    def item_params
    	params.require(:item).permit(:todo, :memo)
    end
 
 end

