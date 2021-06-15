FactoryBot.define do
  factory :vaccine_detail do
    vaccine { nil }
    country { nil }
    authorization_date { "2021-06-15" }
    start_date { "2021-06-15" }
    end_date { "2021-06-15" }
    comment { "MyString" }
    data_source { 1 }
  end
end
