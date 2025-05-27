# Preview all emails at http://localhost:3000/rails/mailers/trial_request_mailer_mailer
class TrialRequestMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/trial_request_mailer_mailer/confirmation
  def confirmation
    TrialRequestMailer.confirmation
  end

  # Preview this email at http://localhost:3000/rails/mailers/trial_request_mailer_mailer/admin_notification
  def admin_notification
    TrialRequestMailer.admin_notification
  end

end
