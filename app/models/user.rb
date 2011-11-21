class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :username, :password, :password_confirmation, :remember_me

  has_many :events

  def feed
    Event.where("user_id = ?", id)
  end
end
