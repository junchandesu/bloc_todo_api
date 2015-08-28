class ApiController < ApplicationController
	skip_before_action :verify_authenticity_token

	private
	
    def authenticated?
      authenticate_or_request_with_http_basic {|email, token| valid_user(email,token).present? }
    end
    
    def valid_user(email,token)
      @current_user = User.where( email: email, token: token).first
    end
end