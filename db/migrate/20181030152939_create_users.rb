class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :street
      t.integer :stNumber
      t.string :city
      t.references :province, foreign_key: true

      t.timestamps
    end
  end
end
