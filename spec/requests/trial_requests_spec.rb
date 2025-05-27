require 'rails_helper'

RSpec.describe "TrialRequests", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/trial_requests/create"
      expect(response).to have_http_status(:success)
    end
  end

end
