FactoryBot.define do
  factory :onboarding_assignment do
    status { 1 }
    started_at { "2025-05-27 10:55:43" }
    completed_at { "2025-05-27 10:55:43" }
    user { nil }
    onboarding_template { nil }
  end
end
