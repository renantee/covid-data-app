class AddVaccinationWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  require "csv"

  # TODO: Need to refactor saving of data
  def perform(csv_file)
    # csv_data = CSV.read(csv_file, headers: true)

    # csv_data.each do |data|
    #   params = {}
    #   csv_data.headers.each do |header|
    #     next unless ["COUNTRY", "ISO3", "VACCINES_USED",
    #                  "NUMBER_VACCINES_TYPES_USED"].exclude?(header)

    #     params[header.downcase.to_sym] = if header == "DATA_SOURCE"
    #                                        data[header] == "REPORTING" ? 0 : 1
    #                                      else
    #                                        data[header]
    #                                      end
    #   end
    #   params[:country_id] = country_id(data)

    #   process_data(data, params)
    # end

    # # Remove CSV file after successfully saved
    # FileUtils.rm csv_file
  end

  private

  def country_id(data)
    country = Country.find_or_create_by(
      country: data["COUNTRY"],
      iso3:    data["ISO3"]
    )

    country.id
  end

  def process_data(data, vaccination_params)
    vaccine_params = []
    data["VACCINES_USED"].to_s.split(",").each do |name|
      vaccine = Vaccine.find_or_create_by(
        vaccine_name: name.strip
      )
      vaccine_params.push({ vaccine_id: vaccine.id })
    end

    parent = Vaccination.create(vaccination_params)
    parent.vaccination_details_attributes = vaccine_params
    parent.save
  end
end
