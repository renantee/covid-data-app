class VaccinationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @vaccinations = Vaccination.filter(filtering_params)
                               .includes(:vaccines, :country)

    @countries = Country.all
    @vaccines = Vaccine.all.order(:vaccine_name)
  end

  def import
    upload_file
    AddVaccinationWorker.perform_async(@amazon_obj.public_url)
    flash[:notice] = "CSV data has been successfully saved."
    redirect_to root_path
  end

  def destroy
    RemoveVaccinationWorker.perform_async
    flash[:notice] = "CSV data has been successfully deleted."
    redirect_to root_path
  end

  private

  def upload_file
    s3 = Aws::S3::Resource.new
    bucket = s3.bucket(ENV["S3_BUCKET"])
    file = params[:file]
    filename = file.original_filename

    @amazon_obj = bucket.object(filename)
    @amazon_obj.put(body: file.to_io)
  end

  # A list of the param names that can be used for filtering the vaccinations list
  def filtering_params
    params.slice(:country, :data_source, :vaccine,
                 :date_updated_start_date, :date_updated_end_date,
                 :first_vaccine_date_start, :first_vaccine_date_end)
  end
end
