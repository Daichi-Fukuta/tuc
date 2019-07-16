class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false, length: 50
      # t.string :state, null: false
      # t.string :postage, null: false
      # t.string :region, null: false
      # t.date :shipping_date, null: false
      t.integer :price, null: false
      t.text :description, null: false, length: 1000

      t.timestamps
    end
  end
end
