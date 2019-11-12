class AppDuration < ApplicationRecord
    has_many :app_schedules

    validates :duration, presence: true
    validates_uniqueness_of :duration
    validates_uniqueness_of :durationPrice
    validates :durationPrice, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates_uniqueness_of :duration, :durationPrice

    
end
