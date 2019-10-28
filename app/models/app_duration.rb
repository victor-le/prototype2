class AppDuration < ApplicationRecord
    has_many :app_schedules

    validates :duration, presence: true
    validates :durationPrice, presence: true
end
