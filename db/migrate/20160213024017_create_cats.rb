class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.string :image_url
      t.integer :user_id
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
