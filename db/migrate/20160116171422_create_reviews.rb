class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :author
      t.text :content
      t.integer :star

      t.timestamps null: false
    end
  end
end
