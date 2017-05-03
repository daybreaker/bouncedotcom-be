class Bounce < ApplicationRecord
  belongs_to :user, optional: true
end
