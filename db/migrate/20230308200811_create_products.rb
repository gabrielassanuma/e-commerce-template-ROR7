class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :price
      t.references :category, null: false, foreign_key: true
      t.references :discount, null: false, foreign_key: true
      t.boolean :active

      t.timestamps
    end
  end
end
