class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.integer :year_period_id, null: false
      t.string :lecture, null: false
      t.string :teacher, null: false
      t.integer :sales_status_id, null: false
      t.integer :scheduled_delivery_id, null: false
      t.string :author, null: false
      t.string :publisher, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
