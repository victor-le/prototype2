class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :app_schedules, dependent: :destroy

  validates :phone_number,  :presence => {:message => 'hello world, bad operation!'},
  :numericality => true,
  :length => { :minimum => 10, :maximum => 15 }
  
end
