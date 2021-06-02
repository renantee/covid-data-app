class VaccinationsController < ApplicationController
  def index
    @vaccinations = Vaccination.all
  end

  def import
    Vaccination.import(params[:file])
  end
end
