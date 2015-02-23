class User < ActiveRecord::Base
  acts_as_jwt_authenticatable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :meals

  def serializable_hash(options = {})
    options = { only: [:daily_calories_limit], methods: [:show]}.update(options || {})
    super(options)
  end
end
