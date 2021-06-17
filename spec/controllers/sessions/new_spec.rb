require "rails_helper"

RSpec.describe Devise::SessionsController do
  describe "GET #new" do
    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      get :new
    end

    it "returns a 200 response" do
      expect(response).to have_http_status :ok
    end

    it "renders the :new view" do
      expect(response).to render_template(:new)
    end
  end
end
