class RemoveCategoryFromItems < ActiveRecord::Migration[5.0]
  def change
    remove_reference :items, :category, foreign_key: true
  end
end
