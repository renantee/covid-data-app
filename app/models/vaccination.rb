class Vaccination < ApplicationRecord
  has_many :vaccination_details, dependent: :destroy
  has_many :vaccines, through: :vaccination_details
  belongs_to :country

  # enable nested attributes
  accepts_nested_attributes_for :vaccination_details
end
