class Vaccine < ApplicationRecord
  enum data_source: {
    reporting: 0,
    owid:      1
  }, _prefix: true
end
