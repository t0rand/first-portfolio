class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :maker
      t.string :name
      t.string :image_id
      t.date :release_date
      t.boolean :is_lens, null: false, default: FALSE
      t.boolean :is_sales, null: false, default: TRUE

      t.timestamps
    end
  end
end
