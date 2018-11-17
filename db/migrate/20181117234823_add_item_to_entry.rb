class AddItemToEntry < ActiveRecord::Migration[5.2]
  def change
    add_reference :entries, :item, foreign_key: true
  end
end
