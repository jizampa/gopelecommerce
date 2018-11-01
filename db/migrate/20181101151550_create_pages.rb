class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.string :name
      t.string :title
      t.text :subtitle
      t.text :description
      t.string :image
      t.text :footer

      t.timestamps
    end
  end
end
