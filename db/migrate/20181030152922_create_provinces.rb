class CreateProvinces < ActiveRecord::Migration[5.2]
  def change
    create_table :provinces do |t|
      t.string :name
      t.string :acronyms
      t.float :PST
      t.float :GST
      t.float :HST
      t.string :country

      t.timestamps
    end
  end
end
