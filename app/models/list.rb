class List < ActiveRecord::Base
  belongs_to :user
  has_many :items, dependent: :destroy

  def update_ok?(permission)
  	permission == "private" || permission == "viewable" || permission == "open"
  end

  def info
  	"#{user.full_name} has list ' #{title}'"
  end
end
