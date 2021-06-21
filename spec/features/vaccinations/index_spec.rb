require "rails_helper"

RSpec.feature "Vaccinations#index", type: :feature do
  let(:country) { create(:country) }
  let(:user) { create(:user, country_id: country.id) }
  let(:admin) { create(:user, country_id: country.id, is_admin: true) }
  let!(:vaccinations) { create_list(:vaccination, 5, country: country) }

  scenario "Displays Upload CSV Data section for Admin user" do
    sign_in_as admin
    expect(page).to have_current_path vaccinations_path
    expect(page).to have_content "Upload CSV Data"
  end

  scenario "Displays vaccinations's list in Dashboard" do
    sign_in_as user
    expect(page).to have_current_path vaccinations_path

    page.all("table.table tbody tr").each_with_index do |row, index|
      within(row) do
        table_data = all("td")

        expect(table_data[1]).to have_text vaccinations[index].country.country
        expect(table_data[2]).to have_text vaccinations[index].country.iso3
        expect(table_data[3]).to have_text vaccinations[index].data_source.upcase
        expect(table_data[4]).to have_text vaccinations[index].date_updated
        expect(table_data[5]).to have_text vaccinations[index].total_vaccinations
        expect(table_data[6]).to have_text vaccinations[index].persons_vaccinated_1plus_dose
        expect(table_data[7]).to have_text vaccinations[index].total_vaccinations_per100
      end
    end
  end
end
