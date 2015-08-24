class List < ActiveRecord::Base
  belongs_to :user
  has_many :items

  def info
  	"#{user.full_name} has list ' #{title}'"
  end
end
