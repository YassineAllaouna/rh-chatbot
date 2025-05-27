FactoryBot.define do
  factory :step do
    title { "MyString" }
    content { "MyText" }
    position { 1 }
    onboarding_template { nil }
  end
end
