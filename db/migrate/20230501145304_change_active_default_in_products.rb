class ChangeActiveDefaultInProducts < ActiveRecord::Migration[7.0]
  def change
    change_column_default :products, :active, from: nil, to: true
  end
end
