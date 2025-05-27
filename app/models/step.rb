class Step < ApplicationRecord
  belongs_to :onboarding_template
  has_many :step_completions
  has_many :onboarding_assignments, through: :step_completions

  validates :title, presence: true
  validates :content, presence: true
  validates :position, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  before_validation :set_position, on: :create

  private

  def set_position
    return if position.present?
    self.position = onboarding_template.steps.count
  end
end
