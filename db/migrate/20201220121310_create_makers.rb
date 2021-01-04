class CreateMakers < ActiveRecord::Migration[5.2]
  def change
    create_table :makers do |t|
      t.string :name
      t.boolean :is_active, default: TRUE

      t.timestamps
    end
  end
end
