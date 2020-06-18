class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :tenant_name, null: false

      t.timestamps
    end
    add_index :clients, :tenant_name, unique: true
  end
end
