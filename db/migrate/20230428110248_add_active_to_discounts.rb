class AddActiveToDiscounts < ActiveRecord::Migration[7.0]
  def change
    add_column :discounts, :active, :boolean, default: true
  end
end