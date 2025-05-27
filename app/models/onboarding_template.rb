class OnboardingTemplate < ApplicationRecord
  has_many :steps, -> { order(position: :asc) }, dependent: :destroy
  has_many :onboarding_assignments
  has_many :users, through: :onboarding_assignments

  validates :title, presence: true
  validates :description, presence: true

  accepts_nested_attributes_for :steps, allow_destroy: true, reject_if: :all_blank
end
