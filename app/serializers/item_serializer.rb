class ItemSerializer < ActiveModel::Serializer
	attributes :id, :created_at, :item_info

	def created_at
		object.created_at.strftime('created at %A, %D')
	end

	def item_info
		object.item_info
	end

end