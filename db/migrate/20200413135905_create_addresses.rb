class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :postal_code
      t.string :prefectures
      t.string :municipality
      t.string :block_number
      t.string :building
      t.integer :user_id

      t.timestamps
    end
  end
end
