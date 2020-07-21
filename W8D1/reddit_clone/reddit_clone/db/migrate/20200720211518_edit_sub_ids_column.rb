class EditSubIdsColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :sub_ids
    add_column :posts, :sub_ids, :integer, array: true, default: []
  end
end
