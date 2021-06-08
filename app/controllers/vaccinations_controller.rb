class VaccinationsController < ApplicationController
  def index
    @vaccinations = Vaccination.all
  end

  def import
    AddVaccinationWorker.perform_async(params[:file].path)
    flash[:notice] = "CSV data has been successfully saved."
    redirect_to vaccinations_path
  end

  def destroy
    RemoveVaccinationWorker.perform_async
    flash[:notice] = "CSV data has been successfully deleted."
    redirect_to vaccinations_path
  end
end
