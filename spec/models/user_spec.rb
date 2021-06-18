require "rails_helper"

RSpec.describe User, type: :model do
  subject do
    @country = create(:country)
    @user = attributes_for(:user)
    described_class.new(@user)
  end

  it "is database authenticable" do
    expect(subject.valid_password?(subject.password)).to be_truthy
  end

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a country" do
    subject.country_id = nil
    expect(subject).to_not be_valid
  end
end
