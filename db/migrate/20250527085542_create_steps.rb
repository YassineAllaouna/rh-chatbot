class CreateSteps < ActiveRecord::Migration[7.1]
  def change
    create_table :steps do |t|
      t.string :title
      t.text :content
      t.integer :position
      t.references :onboarding_template, null: false, foreign_key: true

      t.timestamps
    end
  end
end
