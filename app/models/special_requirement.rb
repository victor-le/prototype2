class SpecialRequirement < ApplicationRecord
    has_many :appschedules, dependent: :destroy
end
