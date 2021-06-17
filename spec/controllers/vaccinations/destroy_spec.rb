require "rails_helper"

RSpec.describe VaccinationsController do
  describe "DELETE #destroy" do
    before do
      sign_in login_user
      delete :destroy
    end

    it "redirects to Home after delete" do
      expect(response).to redirect_to root_path
    end
  end
end
