require "rails_helper"
require_relative "shared_context"

RSpec.describe VaccinationsController do
  describe "POST #import" do
    before do
      sign_in login_user
    end

    include_context "valid file"
    include_context "invalid file"
  end
end
