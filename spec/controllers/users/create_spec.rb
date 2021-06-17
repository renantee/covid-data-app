require "rails_helper"
require_relative "shared_context"

RSpec.describe Devise::RegistrationsController do
  describe "POST #create" do
    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @country = create(:country)
      @user_params = attributes_for(:user, country_id: @country.id)
    end

    include_context "valid registration fields"
    include_context "invalid registration fields"
  end
end
