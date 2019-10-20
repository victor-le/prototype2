class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :clientFName
      t.string :clientLName
      t.string :clientEmail
      t.string :clientPhone

      t.timestamps
    end
  end
end
