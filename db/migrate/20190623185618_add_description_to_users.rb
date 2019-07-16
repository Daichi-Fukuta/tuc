class AddDescriptionToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :description, :text, length: 1000, after: :address
  end
end
