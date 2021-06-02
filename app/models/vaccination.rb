class Vaccination < ApplicationRecord
  require "csv"

  has_many :vaccination_details, dependent: :destroy

  def self.import(file)
    csv_data = CSV.read(file.path, headers: true)

    csv_data.each do |data|
      vaccination_data = {}
      csv_data.headers.each do |header|
        if ["COUNTRY", "ISO3", "DATA_SOURCE", "VACCINES_USED",
            "NUMBER_VACCINES_TYPES_USED"].exclude?(header)
          vaccination_data[header.downcase.to_sym] = data[header]
        end
      end

      create! vaccination_data
    end
  end
end
