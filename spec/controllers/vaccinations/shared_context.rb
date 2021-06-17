RSpec.shared_context "valid file" do
  context "with file to import" do
    subject do
      @file = fixture_file_upload("vaccination-data.csv", "text/csv")
      post :import, params: { file: @file }
    end

    it "redirects to Home after successful upload" do
      expect(subject).to redirect_to root_path
    end
  end
end

RSpec.shared_context "invalid file" do
  context "without any file to import" do
    subject do
      post :import
    end

    it "redirects back to Dashboard must choose a file" do
      expect(subject).to redirect_to vaccinations_path
    end
  end
end
