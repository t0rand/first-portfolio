class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|

      t.string :name
      t.text :introduction
      t.string :image_id
      t.integer :maker_id
      t.date :release_date
      t.float :rate
      t.boolean :is_lens, default: FALSE
      t.boolean :is_sales, default: TRUE

      t.timestamps
    end
  end
end
