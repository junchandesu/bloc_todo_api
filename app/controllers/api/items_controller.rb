class Api::ItemsController < ApiController
   before_action :authenticated?

   def index
   	items = Item.all
    render json: items, each_serializer: ItemSerializer
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

    def edit
      list = List.find(params[:list_id])
      item = list.items(params[:id])
    end

    def update
      list = List.find(params[:list_id])
      item = list.items.find(params[:id])
      if  item.list.update_ok?(item.list.permissions) && item.update(item_params)
        render json: item
      else
        render json: { error: item.errors.full_message }, status: :unprocessable_entity
      end
    end




    private

    def item_params
    	params.require(:item).permit(:todo, :memo)
    end
 
 end

