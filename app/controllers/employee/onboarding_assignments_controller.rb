class Employee::OnboardingAssignmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_employee
  before_action :set_onboarding_assignment

  def show
    @steps = @onboarding_assignment.steps.includes(:step_completions)
  end

  def complete_step
    @step = @onboarding_assignment.steps.find(params[:step_id])
    @step_completion = @onboarding_assignment.step_completions.find_or_initialize_by(step: @step)
    
    if @step_completion.save
      if @onboarding_assignment.steps.count == @onboarding_assignment.step_completions.count
        @onboarding_assignment.update(status: :completed, completed_at: Time.current)
      end
      
      respond_to do |format|
        format.html { redirect_to employee_onboarding_assignment_path(@onboarding_assignment), notice: 'Étape complétée avec succès.' }
        format.json { render json: { progress: @onboarding_assignment.progress_percentage } }
      end
    else
      respond_to do |format|
        format.html { redirect_to employee_onboarding_assignment_path(@onboarding_assignment), alert: 'Erreur lors de la complétion de l\'étape.' }
        format.json { render json: { error: 'Erreur lors de la complétion de l\'étape.' }, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_onboarding_assignment
    @onboarding_assignment = current_user.onboarding_assignments.find(params[:id])
  end

  def require_employee
    unless current_user.employee?
      redirect_to root_path, alert: "Vous n'avez pas les droits d'accès."
    end
  end
end
