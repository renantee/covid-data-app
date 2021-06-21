require "rails_helper"

RSpec.describe CsvVaccination, type: :model do
  subject do
    @csv_vaccination = attributes_for(:csv_vaccination)
    described_class.new(@csv_vaccination)
  end

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
end
