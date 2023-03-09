class AddEnumroleToUser < ActiveRecord::Migration[7.0]
  def change
    create_enum :role, ['user', 'admin']

    change_table :orders do |t|
      t.enum :user, enum_type: 'role', default: 'user', null: false
    end

  end
end
