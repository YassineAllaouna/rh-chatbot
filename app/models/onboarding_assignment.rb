class OnboardingAssignment < ApplicationRecord
  belongs_to :user
  belongs_to :onboarding_template
  has_many :step_completions, dependent: :destroy
  has_many :steps, through: :onboarding_template

  enum status: { in_progress: 0, completed: 1 }

  validates :user_id, uniqueness: { scope: :onboarding_template_id }
  validates :status, presence: true

  before_validation :set_default_status, on: :create
  before_validation :set_started_at, on: :create

  def progress_percentage
    return 0 if steps.empty?
    ((step_completions.count.to_f / steps.count) * 100).round
  end

  private

  def set_default_status
    self.status ||= :in_progress
  end

  def set_started_at
    self.started_at ||= Time.current
  end
end
