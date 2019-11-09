class CreateInboxTables < ActiveRecord::Migration[6.0]
  def change
    create_table :inbox_tables do |t|
      t.string :full_name
      t.string :email
      t.string :subject
      t.text :message
      t.timestamps
    end
  end
end
