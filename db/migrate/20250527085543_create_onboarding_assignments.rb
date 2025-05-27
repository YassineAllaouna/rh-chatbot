class CreateOnboardingAssignments < ActiveRecord::Migration[7.1]
  def change
    create_table :onboarding_assignments do |t|
      t.integer :status
      t.datetime :started_at
      t.datetime :completed_at
      t.references :user, null: false, foreign_key: true
      t.references :onboarding_template, null: false, foreign_key: true

      t.timestamps
    end
  end
end
