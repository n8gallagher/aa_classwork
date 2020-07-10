class AddNullConstraint < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :username, from: true, to: false
  end
end
