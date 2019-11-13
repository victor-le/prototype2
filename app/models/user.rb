class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :app_schedules, dependent: :destroy
  validates_uniqueness_of :email

  
  validates :phone_number, format: { with: /((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}/,
    message: "Numbers must be formated in xxx-xxx-xxxx " }
  
end
