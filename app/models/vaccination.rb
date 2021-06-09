class Vaccination < ApplicationRecord
  has_many :vaccination_details, dependent: :destroy

  # enable nested attributes
  accepts_nested_attributes_for :vaccination_details
end
