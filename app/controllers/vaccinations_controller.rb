class VaccinationsController < ApplicationController
  def index
    @vaccinations = Vaccination.all
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
end
