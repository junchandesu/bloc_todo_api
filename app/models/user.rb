class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :lists, dependent: :destroy
  before_create :generate_token

  def full_name
     [first_name, last_name].join(" ")
  end

  def authenticated?(username, token)
    username == User.username && token = User.token

  end

  protected

  def generate_token
  	self.token = loop do
  		random_token = SecureRandom.urlsafe_base64(nil, false)
  		break random_token unless User.exists?(token: random_token)
  	end
  end


end
