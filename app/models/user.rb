class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { employee: 0, admin: 1 }

  has_many :onboarding_assignments
  has_many :onboarding_templates, through: :onboarding_assignments

  validates :email, presence: true, uniqueness: true
  validates :role, presence: true
end
