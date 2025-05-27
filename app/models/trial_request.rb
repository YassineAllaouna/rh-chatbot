class TrialRequest < ApplicationRecord
  validates :company_name, presence: true
  validates :full_name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, format: { with: /\A\+?[\d\s-]+\z/, message: "doit être un numéro de téléphone valide" }, allow_blank: true

  before_validation :set_default_status

  private

  def set_default_status
    self.status ||= 'pending'
  end
end
