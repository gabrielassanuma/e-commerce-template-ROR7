class CreateUserPayments < ActiveRecord::Migration[7.0]
  def change
    create_table :user_payments do |t|
      t.references :user, null: false, foreign_key: true
      t.string :card_name
      t.string :card_number
      t.string :card_expiration

      t.timestamps
    end
  end
end
