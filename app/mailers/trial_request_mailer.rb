class TrialRequestMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.trial_request_mailer.confirmation.subject
  #
  def confirmation(trial_request)
    @trial_request = trial_request
    mail(
      to: @trial_request.email,
      subject: "Confirmation de votre demande d'essai gratuit"
    )
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.trial_request_mailer.admin_notification.subject
  #
  def admin_notification(trial_request)
    @trial_request = trial_request
    mail(
      to: "admin@example.com", # À remplacer par l'adresse email de l'administrateur
      subject: "Nouvelle demande d'essai gratuit"
    )
  end
end
