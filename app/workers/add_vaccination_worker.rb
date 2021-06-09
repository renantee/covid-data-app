class AddVaccinationWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  require "csv"

  def perform(csv_file)
    csv_data = CSV.read(csv_file, headers: true)

    csv_data.each do |data|
      params = {}
      csv_data.headers.each do |header|
        if ["COUNTRY", "ISO3", "DATA_SOURCE", "VACCINES_USED",
            "NUMBER_VACCINES_TYPES_USED"].exclude?(header)
          params[header.downcase.to_sym] = data[header]
        end
      end

      process_data(data, params)
    end

    # Remove CSV file after successfully saved
    FileUtils.rm csv_file
  end

  private

  def process_data(data, vaccination_params)
    vaccine_params = []
    data["VACCINES_USED"].to_s.split(",").each do |name|
      vaccine = Vaccine.find_or_create_by(
        vaccine_name: name,
        iso3:         data["ISO3"],
        data_source:  data["DATA_SOURCE"] == "REPORTING" ? 0 : 1
      )
      vaccine_params.push({ vaccine_id: vaccine.id })
    end

    parent = Vaccination.create(vaccination_params)
    parent.vaccination_details_attributes = vaccine_params
    parent.save
  end
end
