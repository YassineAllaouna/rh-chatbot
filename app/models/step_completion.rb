class StepCompletion < ApplicationRecord
  belongs_to :step
  belongs_to :onboarding_assignment

  validates :step_id, uniqueness: { scope: :onboarding_assignment_id }
  validates :completed_at, presence: true

  before_validation :set_completed_at, on: :create

  private

  def set_completed_at
    self.completed_at ||= Time.current
  end
end
