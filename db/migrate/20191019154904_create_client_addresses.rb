class CreateClientAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :client_addresses do |t|
      t.references :client, null: false, foreign_key: true
      t.references :appaddress, null: false, foreign_key: true
      t.string :comments

      t.timestamps
    end
  end
end
