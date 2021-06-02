class VaccinationDetail < ApplicationRecord
  belongs_to :vaccination
  belongs_to :vaccine
end
