class Vaccination < ApplicationRecord
  include Filterable
  scope :filter_by_country, ->(country_id) { where country_id: country_id }

  has_many :vaccination_details, dependent: :destroy
  has_many :vaccines, through: :vaccination_details
  belongs_to :country

  # enable nested attributes
  accepts_nested_attributes_for :vaccination_details
end
