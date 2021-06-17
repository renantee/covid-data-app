require "rails_helper"
require_relative "shared_context"

RSpec.describe Devise::SessionsController do
  describe "POST #create" do
    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @country = create(:country)
      @user = create(:user, country_id: @country.id)
    end

    include_context "valid login credentials"
    include_context "invalid login credentials"
  end
end
