class Service < ApplicationRecord
    has_many :app_schedules

    validates :serviceName, presence: true
    validates :servicePrice, presence: true
    validates :servicePrice, numericality: { greater_than: 0 }
    validates_uniqueness_of :serviceName

end
