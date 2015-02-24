class User < ActiveRecord::Base
  acts_as_jwt_authenticatable

  # Include default devise modules. Others available are:
  # :recoverable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable

  has_many :meals

  def serializable_hash(options = {})
    options = { only: [:daily_calories_limit, :id]}.update(options || {})
    super(options)
  end
end
