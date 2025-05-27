module Employee
  class DashboardController < ApplicationController
    before_action :authenticate_user!
    before_action :require_employee

    def index
      @onboarding_assignments = current_user.onboarding_assignments
    end

    private

    def require_employee
      unless current_user.employee?
        redirect_to root_path, alert: "Vous n'avez pas les droits d'accès."
      end
    end
  end
end
