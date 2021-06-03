class VaccinationsController < ApplicationController
  def index
    @vaccinations = Vaccination.all
  end

  def import
    import_csv(params[:file])
    flash[:notice] = "CSV data has been successfully saved."
    redirect_to vaccinations_path
  end

  private

  def import_csv(file)
    csv_data = CSV.read(file.path, headers: true)

    @csv_params = []
    csv_data.each do |data|
      data_params = {}
      csv_data.headers.each do |header|
        data_params[header.downcase.to_sym] = data[header]
      end

      @csv_params.push(data_params)
    end

    save_csv_data
  end

  def save_csv_data
    CsvVaccination.transaction do
      @csv_params.each { |csv_vaccination| CsvVaccination.create(csv_vaccination) }
    end
  end
end
