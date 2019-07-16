class AddDetailsToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :saler, foreign_key: { to_table: :users }, after: :id
  end
end
