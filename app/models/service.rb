class Service < ApplicationRecord
    has_many :app_schedules, dependent: :destroy
end
