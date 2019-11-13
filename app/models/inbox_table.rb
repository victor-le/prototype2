class InboxTable < ApplicationRecord
    validates_uniqueness_of :email
end
