class AddGendersIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :gender, foreign_key: true, index: true, after: :last_name_phonetic
  end
end
