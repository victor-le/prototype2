class SpecialRequirement < ApplicationRecord
    has_many :app_schedules, dependent: :destroy
end
