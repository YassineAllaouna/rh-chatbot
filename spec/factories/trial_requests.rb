FactoryBot.define do
  factory :trial_request do
    company_name { "MyString" }
    full_name { "MyString" }
    email { "MyString" }
    phone { "MyString" }
    message { "MyText" }
    status { "MyString" }
  end
end
