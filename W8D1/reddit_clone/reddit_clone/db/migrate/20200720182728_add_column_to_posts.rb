class AddColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :sub_id
    add_column :posts, :sub_ids, :text, array: true, default: []
  end
end
