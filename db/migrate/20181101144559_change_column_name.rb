class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :statuses, :status, :name
  end
end
