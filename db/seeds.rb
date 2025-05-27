# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Création des utilisateurs
admin = User.create!(
  email: 'admin@example.com',
  password: 'password',
  role: :admin
)

employee = User.create!(
  email: 'employee@example.com',
  password: 'password',
  role: :employee
)

# Création d'un parcours d'onboarding
template = OnboardingTemplate.create!(
  title: 'Parcours Développeur Junior',
  description: 'Parcours d\'intégration pour les développeurs juniors'
)

# Création des étapes
steps = [
  {
    title: 'Configuration de l\'environnement',
    content: 'Installer les outils de développement et configurer l\'environnement de travail',
    position: 0
  },
  {
    title: 'Formation aux bonnes pratiques',
    content: 'Suivre la formation sur les bonnes pratiques de développement',
    position: 1
  },
  {
    title: 'Premier projet',
    content: 'Commencer à travailler sur un premier projet avec l\'équipe',
    position: 2
  }
]

steps.each do |step_attrs|
  template.steps.create!(step_attrs)
end

# Assignation du parcours à l'employé
OnboardingAssignment.create!(
  user: employee,
  onboarding_template: template,
  status: :in_progress
)
