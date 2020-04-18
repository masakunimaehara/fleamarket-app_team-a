class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :address_first_name,null: false
      t.string :address_family_name,null: false
      t.string :postal_code,null: false
      t.string :prefectures,null: false
      t.string :municipality,null: false
      t.string :block_number,null: false
      t.string :building,null: false
      t.integer :user_id,null: false
      t.timestamps
    end
  end
end
