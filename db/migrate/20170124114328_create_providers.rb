class CreateProviders < ActiveRecord::Migration[5.0]
  def change
    create_table :providers do |t|
      t.string :name
      t.string :web
      t.string :address
      t.string :gmaps_link
      t.decimal :dollar_price
      t.decimal :tax

      t.timestamps
    end
  end
end
