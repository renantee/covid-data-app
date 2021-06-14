class Country < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :vaccinations, dependent: :destroy
end
