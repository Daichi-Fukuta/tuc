class AddStatesIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :state, foreign_key: true, index: true, after: :name
  end
end
