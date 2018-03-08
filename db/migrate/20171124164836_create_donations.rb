class CreateDonations < ActiveRecord::Migration[5.0]
  def change
    create_table :donations do |t|
      t.string :token
      t.string :name
      t.string :stripe_customer_id
      t.string :email
      t.decimal :amount
      t.text :personal_message
      t.string :private_id

      t.timestamps
    end
  end
end
