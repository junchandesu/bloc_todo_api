class ListSerializer < ActiveModel::Serializer
	attributes :id, :created_at,  :info

	def created_at
		object.created_at.strftime('created at %I:%M%p on %m/%d/%Y')
	end

	def info
		object.info
	end

end
