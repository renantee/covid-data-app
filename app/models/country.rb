class Country < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :vaccinations, dependent: :destroy

  validates :country, :iso2, :iso3, presence: true
end
