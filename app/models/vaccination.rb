class Vaccination < ApplicationRecord
  require "csv"

  has_many :vaccination_details, dependent: :destroy

  # enable nested attributes
  accepts_nested_attributes_for :vaccination_details

  def self.import(file)
    csv_data = CSV.read(file.path, headers: true)

    csv_data.each do |data|
      params = {}
      csv_data.headers.each do |header|
        if ["COUNTRY", "ISO3", "DATA_SOURCE", "VACCINES_USED",
            "NUMBER_VACCINES_TYPES_USED"].exclude?(header)
          params[header.downcase.to_sym] = data[header]
        end
      end

      vaccines = Vaccine.where(vaccine_name: data["VACCINES_USED"].split(","),
                               iso3:         data["ISO3"])

      vaccine_params = []
      vaccines.each do |vaccine|
        vaccine_params.push({ vaccine_id: vaccine.id })
      end

      parent = create(params)
      parent.vaccination_details_attributes = vaccine_params
      parent.save
    end
  end
end
