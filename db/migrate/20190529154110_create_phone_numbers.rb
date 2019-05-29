class CreatePhoneNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :phone_numbers do |t|
      t.string :p_number
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
