class VaccinationsController < ApplicationController
  before_action :authenticate_user!
  before_action :no_file_chosen, only: %i[import]

  def index
    @vaccinations = Vaccination.filter(filtering_params)
                               .includes(:vaccines, :country)

    @chart_data = @vaccinations.group(:vaccine_name)
                               .sum(:total_vaccinations)

    @countries = Country.all
    @vaccines = Vaccine.all.order(:vaccine_name)
  end

  def import
    file_content = params[:file].read.force_encoding("UTF-8")

    AddVaccinationWorker.perform_async(file_content)
    flash[:notice] = "CSV data has been successfully saved."
    redirect_to root_path
  end

  def destroy
    RemoveVaccinationWorker.perform_async
    flash[:notice] = "CSV data has been successfully deleted."
    redirect_to root_path
  end

  private

  def no_file_chosen
    return unless params[:file].nil?

    flash[:alert] = "You must choose a file to import!"
    redirect_to vaccinations_path
  end

  # A list of the param names that can be used for filtering the vaccinations list
  def filtering_params
    params.slice(:country, :data_source, :vaccine,
                 :date_updated_start_date, :date_updated_end_date,
                 :first_vaccine_date_start, :first_vaccine_date_end)
  end
end
