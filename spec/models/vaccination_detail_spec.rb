require "rails_helper"

RSpec.describe VaccinationDetail, type: :model do
  subject do
    @vaccine = create(:vaccine)
    @country = create(:country)
    @vaccination = create(:vaccination, country_id: @country.id)
    @vaccination_detail = attributes_for(:vaccination_detail,
                                         vaccine_id:     @vaccine.id,
                                         vaccination_id: @vaccination.id)
    described_class.new(@vaccination_detail)
  end

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without vaccine id" do
    subject.vaccine_id = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without vaccination id" do
    subject.vaccination_id = nil
    expect(subject).to_not be_valid
  end
end
