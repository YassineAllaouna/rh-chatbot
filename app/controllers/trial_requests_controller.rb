class TrialRequestsController < ApplicationController
  def create
    @trial_request = TrialRequest.new(trial_request_params)

    if @trial_request.save
      TrialRequestMailer.confirmation(@trial_request).deliver_now
      TrialRequestMailer.admin_notification(@trial_request).deliver_now
      redirect_to root_path, notice: "Votre demande d'essai gratuit a été envoyée avec succès !"
    else
      redirect_to root_path, alert: "Une erreur est survenue lors de l'envoi de votre demande."
    end
  end

  private

  def trial_request_params
    params.require(:trial_request).permit(:company_name, :full_name, :email, :phone, :message)
  end
end
