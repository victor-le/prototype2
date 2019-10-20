class ClientAddress < ApplicationRecord
  belongs_to :client
  belongs_to :appaddress
end
