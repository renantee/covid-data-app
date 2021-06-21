require "rails_helper"

RSpec.feature "Sessions#destroy", type: :feature do
  let(:country) { create(:country) }
  let(:user) { create(:user, country_id: country.id) }

  scenario "Current logged-in user logs out" do
    sign_in_as user
    click_link "Logout"

    expect(page).to have_current_path root_path
    expect(page).to have_content "Signed out successfully."
  end
end
