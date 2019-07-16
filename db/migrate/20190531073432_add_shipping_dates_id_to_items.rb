class AddShippingDatesIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :shipping_date, foreign_key: true, index:true, after: :region_id
  end
end
