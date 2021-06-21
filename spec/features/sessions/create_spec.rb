require "rails_helper"

RSpec.feature "Sessions#create", type: :feature do
  let(:country) { create(:country) }
  let(:user) { create(:user, country_id: country.id) }

  scenario "Signing in with correct credentials" do
    sign_in_as user

    expect(page).to have_current_path vaccinations_path
    expect(page).to have_content "Signed in successfully."
  end

  scenario "Signing in without email" do
    user.email = nil
    sign_in_as user

    expect(page).to have_current_path user_session_path
    expect(page).to have_content "Invalid Email or password."
  end

  scenario "Signing in without password" do
    user.password = nil
    sign_in_as user

    expect(page).to have_current_path user_session_path
    expect(page).to have_content "Invalid Email or password."
  end
end
