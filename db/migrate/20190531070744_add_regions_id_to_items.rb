class AddRegionsIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :region, foreign_key: true, index: true, after: :postage_id
  end
end
