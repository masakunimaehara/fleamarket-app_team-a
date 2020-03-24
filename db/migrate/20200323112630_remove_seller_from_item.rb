class RemoveSellerFromItem < ActiveRecord::Migration[5.0]
  def change
    remove_reference :items, :seller, foreign_key: { to_table: :users }
  end
end
