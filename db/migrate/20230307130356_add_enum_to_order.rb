class AddEnumToOrder < ActiveRecord::Migration[7.0]
  def change
    create_enum :status, ['new_order', 'payed', 'in_transit', 'delivered']

    change_table :orders do |t|
      t.enum :order, enum_type: 'status', default: 'new_order', null: false
    end

  end
end
