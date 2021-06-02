FactoryBot.define do
  factory :vaccination do
    who_region { "MyString" }
    date_updated { "2021-06-02" }
    total_vaccinations { 1 }
    persons_vaccinated_1plus_dose { 1 }
    total_vaccinations_per100 { 1.5 }
    persons_vaccinated_1plus_dose_per100 { 1.5 }
    first_vaccine_date { "2021-06-02" }
  end
end
