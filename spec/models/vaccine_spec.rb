require "rails_helper"

RSpec.describe Vaccine, type: :model do
  subject do
    @vaccine = attributes_for(:vaccine)
    described_class.new(@vaccine)
  end

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without vaccine name" do
    subject.vaccine_name = nil
    expect(subject).to_not be_valid
  end
end
