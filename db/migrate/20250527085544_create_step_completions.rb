class CreateStepCompletions < ActiveRecord::Migration[7.1]
  def change
    create_table :step_completions do |t|
      t.datetime :completed_at
      t.references :step, null: false, foreign_key: true
      t.references :onboarding_assignment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
