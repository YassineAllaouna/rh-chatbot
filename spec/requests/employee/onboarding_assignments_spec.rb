require 'rails_helper'

RSpec.describe "Employee::OnboardingAssignments", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/employee/onboarding_assignments/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/employee/onboarding_assignments/update"
      expect(response).to have_http_status(:success)
    end
  end

end
