class CreateAppAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :app_addresses do |t|
      t.string :homeType
      t.string :homeAddress
      t.string :suiteNumber
      t.string :state
      t.string :city
      t.integer :zipcode

      t.timestamps
    end
  end
end
