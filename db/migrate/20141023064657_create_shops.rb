class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.string :location
      t.string :hours

      t.timestamps
    end
  end
end
