class XsellUserAttributes < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string, default: '', null: false
    add_column :users, :last_name, :string, default: '', null: false
    add_column :users, :start_date, :string
    add_column :users, :end_date, :string
    add_column :users, :password_changed_at, :datetime
    add_index :users, :password_changed_at
  end
end
