class CreateTrialRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :trial_requests do |t|
      t.string :company_name
      t.string :full_name
      t.string :email
      t.string :phone
      t.text :message
      t.string :status

      t.timestamps
    end
  end
end
