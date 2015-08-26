  class Api::UsersController < ApiController
 # #4
   before_action :authenticated?
 
  
  def index
   	users = User.all
   	render json: users, each_serializer: UserSerializer
  end
 
  def create
   	user = User.new(user_params)
   	if user.save
 	   render json: user, each_serializer: UserSerializer 
     else
     	# 422 status code indicating that the data sent was un-processable.
       render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
     end
  end

  def destroy
   	begin
   		user = User.find(params[:id])
   		user.destroy
   		render json: {}, status: :no_content
   	rescue ActiveRecord::RecordNotFound
   		render :jason => {}, :status => :not_found
   	end
  end

  private
  def user_params
   	# If Devise is not used, permit attribute is username, but changed to email
     params.require(:user).permit(:email, :password)
  end
 end