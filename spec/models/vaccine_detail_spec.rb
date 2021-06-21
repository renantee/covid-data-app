require "rails_helper"

RSpec.describe VaccineDetail, type: :model do
  subject do
    @country = create(:country)
    @vaccine = create(:vaccine)
    @vaccine_detail = attributes_for(:vaccine_detail,
                                     country_id: @country.id,
                                     vaccine_id: @vaccine.id)
    described_class.new(@vaccine_detail)
  end

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without country id" do
    subject.country_id = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without vaccine id" do
    subject.vaccine_id = nil
    expect(subject).to_not be_valid
  end
end
