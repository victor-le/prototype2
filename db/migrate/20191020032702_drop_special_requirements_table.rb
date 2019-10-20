class DropSpecialRequirementsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :special_requirements
  end
end
