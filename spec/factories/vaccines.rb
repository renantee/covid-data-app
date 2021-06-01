FactoryBot.define do
  factory :vaccine do
    iso3 { "MyString" }
    vaccine_name { "MyString" }
    product_name { "MyString" }
    company_name { "MyString" }
    authorization_date { "2021-06-01" }
    start_date { "2021-06-01" }
    end_date { "2021-06-01" }
    comment { "MyString" }
    data_source { 1 }
  end
end
