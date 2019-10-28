class SpecialRequirement < ApplicationRecord
    has_many :app_schedules

    validates :requirementDesc, presence: true
    validates :requirementValue, presence: true
end
