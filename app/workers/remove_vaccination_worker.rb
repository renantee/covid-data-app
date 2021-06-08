class RemoveVaccinationWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform
    Vaccination.destroy_all
  end
end
