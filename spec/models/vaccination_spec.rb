require "rails_helper"

RSpec.describe Vaccination, type: :model do
  subject do
    @country = create(:country)
    @vaccination = attributes_for(:vaccination, country_id: @country.id)
    described_class.new(@vaccination)
  end

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without country id" do
    subject.country_id = nil
    expect(subject).to_not be_valid
  end
end
