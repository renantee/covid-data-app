class Vaccine < ApplicationRecord
  has_many :vaccine_details, dependent: :destroy
  has_many :vaccination_details, dependent: :destroy
  has_many :vaccinations, through: :vaccination_details
end
