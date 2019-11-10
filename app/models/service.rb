class Service < ApplicationRecord
    has_many :app_schedules

    validates :serviceName, presence: true
    validates :servicePrice, presence: true
    validates :servicePrice, numericality: { greater_than_or_equal_to: 0, only_integer: true }
    validates_uniqueness_of :serviceName

end
