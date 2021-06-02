class Vaccine < ApplicationRecord
  has_many :vaccination_details, dependent: :destroy

  enum data_source: {
    reporting: 0,
    owid:      1
  }, _prefix: true
end
