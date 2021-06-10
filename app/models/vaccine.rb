class Vaccine < ApplicationRecord
  has_many :vaccination_details, dependent: :destroy
  has_many :vaccinations, through: :vaccination_details

  enum data_source: {
    reporting: 0,
    owid:      1
  }, _prefix: true
end
