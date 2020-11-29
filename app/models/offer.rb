class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :visitor, optional: true
end
