require "rails_helper"

RSpec.describe Devise::SessionsController do
  describe "DELETE #destroy" do
    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      delete :destroy
    end

    it "redirects to Home after sign out" do
      expect(response).to redirect_to root_path
    end
  end
end
