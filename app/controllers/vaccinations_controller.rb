class VaccinationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @vaccinations = Vaccination.filter(params.slice(:country, :data_source, :vaccine))
                               .includes(:vaccines, :country)
    @countries = Country.all
    @vaccines = Vaccine.all.order(:vaccine_name)
  end

  def import
    file_upload(params[:file])

    AddVaccinationWorker.perform_async(@file)
    flash[:notice] = "CSV data has been successfully saved."
    redirect_to root_path
  end

  def destroy
    RemoveVaccinationWorker.perform_async
    flash[:notice] = "CSV data has been successfully deleted."
    redirect_to root_path
  end

  private

  def file_upload(csv_file)
    # require 'fileutils'
    tmp = csv_file.tempfile
    @file = File.join("public", csv_file.original_filename)
    FileUtils.cp tmp.path, @file
  end

  # A list of the param names that can be used for filtering the vaccinations list
  def filtering_params(params)
    params.slice(:country, :data_source, :vaccine)
  end
end
