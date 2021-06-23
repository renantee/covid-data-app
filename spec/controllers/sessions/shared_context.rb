RSpec.shared_context "valid login credentials" do
  context "with valid user params" do
    subject do
      @user_params = { email: @user.email, password: @user.password }
      post :create, params: { user: @user_params }
    end

    it "returns a 200 response" do
      expect(response).to have_http_status :ok
    end

    it "redirects to Home (but technically redirected to Dashboard)" do
      expect(subject).to redirect_to root_path
    end
  end
end

RSpec.shared_context "invalid login credentials" do
  context "with invalid user params" do
    subject do
      @user_params = attributes_for(:user)
      post :create, params: { user: @user_params }
    end

    it "returns a 200 response" do
      expect(response).to have_http_status :ok
    end

    it "redirects back to Login page" do
      expect(subject).to render_template(:new)
    end
  end
end
