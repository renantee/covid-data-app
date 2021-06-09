class AddVaccinationWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  require "csv"

  def perform(csv_file)
    csv_data = CSV.read(csv_file, headers: true)

    csv_data.each do |data|
      data_params = {}
      csv_data.headers.each do |header|
        data_params[header.downcase.to_sym] = data[header]
      end

      CsvVaccination.create(data_params)
    end

    # Remove CSV file after successfully saved
    FileUtils.rm csv_file
  end
end
