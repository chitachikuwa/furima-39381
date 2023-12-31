class CreateCostomers < ActiveRecord::Migration[6.0]
  def change
    create_table :costomers do |t|
      t.string :postal_code,        null: false 
      t.integer :shipping_area_id,  null: false
      t.string :city,               null: false
      t.string :address,            null: false
      t.string :building
      t.string :phone_num,          null: false
      t.references :purchase,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
