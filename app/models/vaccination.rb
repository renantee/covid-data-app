class Vaccination < ApplicationRecord
  has_many :vaccination_details, dependent: :destroy
end
