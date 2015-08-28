class ListSerializer < ActiveModel::Serializer
	attributes :id, :created_at,  :info, :permissions

	def created_at
		object.created_at.strftime('created at %I:%M%p on %m/%d/%Y')
	end

	def info
		object.info
	end

	def update_ok?(permission)
  	 permission == "private" || permission == "viewable" || permission == "open"
    end
end
