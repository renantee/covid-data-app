class Vaccination < ApplicationRecord
  include Filterable
  scope :filter_by_country, ->(country_id) { where country_id: country_id }
  scope :filter_by_data_source, ->(data_source) { where data_source: data_source }
  scope :filter_by_vaccine, lambda { |vaccine_id|
                              joins(:vaccination_details).where(vaccination_details: {
                                                                  vaccine_id: vaccine_id
                                                                })
                            }

  has_many :vaccination_details, dependent: :destroy
  has_many :vaccines, through: :vaccination_details
  belongs_to :country

  # enable nested attributes
  accepts_nested_attributes_for :vaccination_details

  enum data_source: {
    reporting: 0,
    owid:      1
  }, _prefix: true
end
