require "rails_helper"
require "sidekiq/testing"

RSpec.describe RemoveVaccinationWorker do
  describe "RemoveVaccinationWorker#perform" do
    it "does import CSV data to vaccinations table" do
      expect { RemoveVaccinationWorker.perform_async }.to change {
        RemoveVaccinationWorker.jobs.size
      }.by(1)
    end
  end
end
