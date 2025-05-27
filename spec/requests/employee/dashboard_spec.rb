require 'rails_helper'

RSpec.describe "Employee::Dashboards", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/employee/dashboard/index"
      expect(response).to have_http_status(:success)
    end
  end

end
