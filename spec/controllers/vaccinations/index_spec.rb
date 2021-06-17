require "rails_helper"

RSpec.describe VaccinationsController do
  describe "GET #index" do
    before do
      sign_in login_user
      get :index
    end

    it "renders the :index view" do
      expect(response).to render_template(:index)
    end
  end
end
