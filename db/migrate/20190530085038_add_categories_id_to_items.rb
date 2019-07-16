class AddCategoriesIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :category, foreign_key: true, index: true, after: :description
  end
end
