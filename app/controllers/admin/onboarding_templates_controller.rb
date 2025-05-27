module Admin
  class OnboardingTemplatesController < ApplicationController
    before_action :authenticate_user!
    before_action :require_admin
    before_action :set_onboarding_template, only: [:show, :edit, :update, :destroy]

    def index
      @onboarding_templates = OnboardingTemplate.all
    end

    def show
    end

    def new
      @onboarding_template = OnboardingTemplate.new
    end

    def create
      @onboarding_template = OnboardingTemplate.new(onboarding_template_params)
      if @onboarding_template.save
        redirect_to admin_onboarding_templates_path, notice: "Le parcours a été créé avec succès."
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @onboarding_template.update(onboarding_template_params)
        redirect_to admin_onboarding_templates_path, notice: "Le parcours a été mis à jour avec succès."
      else
        render :edit
      end
    end

    def destroy
      @onboarding_template.destroy
      redirect_to admin_onboarding_templates_path, notice: "Le parcours a été supprimé avec succès."
    end

    private

    def set_onboarding_template
      @onboarding_template = OnboardingTemplate.find(params[:id])
    end

    def onboarding_template_params
      params.require(:onboarding_template).permit(:title, :description)
    end

    def require_admin
      unless current_user.admin?
        redirect_to root_path, alert: "Vous n'avez pas les droits d'accès."
      end
    end
  end
end
