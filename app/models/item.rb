class Item < ActiveRecord::Base
  belongs_to :list

  def item_info
	"#{todo.upcase} : #{memo}"
  end
end
