require "rails_helper"
require "sidekiq/testing"

RSpec.describe AddVaccinationWorker do
  let(:my_arguments) { create(:vaccination) }

  describe "AddVaccinationWorker#perform" do
    it "does import CSV data to vaccinations table" do
      expect { AddVaccinationWorker.perform_async(:my_arguments) }.to change {
        AddVaccinationWorker.jobs.size
      }.by(1)
    end
  end
end
