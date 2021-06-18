require "rails_helper"

RSpec.describe Country, type: :model do
  subject do
    @country = attributes_for(:country)
    described_class.new(@country)
  end

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a country" do
    subject.country = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a iso2" do
    subject.iso2 = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a iso3" do
    subject.iso3 = nil
    expect(subject).to_not be_valid
  end
end
