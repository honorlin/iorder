class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :title
      t.integer :user_id
      t.datetime :date
      t.text :content

      t.timestamps
    end
  end
end
