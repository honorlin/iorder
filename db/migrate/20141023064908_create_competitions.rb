class CreateCompetitions < ActiveRecord::Migration
  def change
    create_table :competitions do |t|
      t.integer :shop_id
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end
end
