class VaccineDetail < ApplicationRecord
  belongs_to :vaccine
  belongs_to :country
end
