class AddVaccinationWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  require "csv"

  def perform(content)
    csv_data = CSV.parse(content, headers: :first_row).map(&:to_h)
    csv_data.each do |data|
      params_for_vaccination(data)
      @params[:country_id] = country_id(data)

      process_data(data, @params)
    end
  end

  private

  def params_for_vaccination(data)
    @params = {}
    data.each do |key, value|
      next unless ["COUNTRY", "ISO3", "VACCINES_USED",
                   "NUMBER_VACCINES_TYPES_USED"].exclude?(key)

      @params[key.downcase.to_sym] = if key == "DATA_SOURCE"
                                       value == "REPORTING" ? 0 : 1
                                     else
                                       value
                                     end
    end
  end

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
