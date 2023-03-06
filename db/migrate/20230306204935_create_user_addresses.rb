class CreateUserAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :user_addresses do |t|
      t.string :name
      t.text :address
      t.string :complement
      t.boolean :main
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
