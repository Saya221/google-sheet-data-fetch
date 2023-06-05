class CreateButtons < ActiveRecord::Migration[7.0]
  def change
    create_table :buttons do |t|
      t.string :button_number
      t.string :button_name
      t.string :button_action

      t.timestamps
    end
  end
end
