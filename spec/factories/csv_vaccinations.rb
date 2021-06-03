FactoryBot.define do
  factory :csv_vaccination do
    country { "MyString" }
    iso3 { "MyString" }
    who_region { "MyString" }
    data_source { "MyString" }
    date_updated { "2021-06-03" }
    total_vaccinations { 1 }
    persons_vaccinated_1plus_dose { 1 }
    total_vaccinations_per100 { 1.5 }
    persons_vaccinated_1plus_dose_per100 { 1.5 }
    vaccines_used { "MyString" }
    first_vaccine_date { "2021-06-03" }
    number_vaccines_types_used { "MyString" }
  end
end
