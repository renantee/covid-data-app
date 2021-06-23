RSpec.shared_context "valid registration fields" do
  context "with valid register params" do
    subject do
      post :create, params: { user: @user_params }
    end

    it "creates a new user" do
      expect { subject }.to change(User, :count).by(1)
    end

    it "returns a 200 response" do
      expect(response).to have_http_status :ok
    end

    it "redirects to Home (but technically redirected to Dashboard)" do
      expect(subject).to redirect_to root_path
    end
  end
end

RSpec.shared_context "invalid registration fields" do
  context "with invalid register params" do
    subject do
      @user_params = build(:user)
      post :create, params: { user: @user_params }
    end

    it "did not create a new user" do
      expect { subject }.to change(User, :count).by(0)
    end

    it "returns a 200 response" do
      expect(response).to have_http_status :ok
    end

    it "redirects back to Register page" do
      expect(subject).to render_template(:new)
    end
  end
end
