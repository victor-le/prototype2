class Service < ApplicationRecord
    has_many :app_schedules

    validates :serviceName, presence: true
    validates :servicePrice, presence: true
end
