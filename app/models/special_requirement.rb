class SpecialRequirement < ApplicationRecord
    has_many :app_schedules

    validates :requirementDesc, presence: true
    validates :requirementValue, presence: true
    validates_uniqueness_of :requirements
    validates_uniqueness_of :requirementDesc
end
