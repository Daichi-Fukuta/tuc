class AddPostagesIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :postage, foreign_key: true, index: true, after: :state_id
  end
end
