class Service < ApplicationRecord
    has_many :appschedules, dependent: :destroy
end
