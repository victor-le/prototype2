class AppDuration < ApplicationRecord
    has_many :appschedules, dependent: :destroy
end
