class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :postal_code, null: false
      t.string :prefectures, null: false
      t.string :municipality, null: false
      t.string :block_number, null: false
      t.string :building
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
