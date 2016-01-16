class AddToColumnReviews < ActiveRecord::Migration
  def change
  	add_column :reviews, :github_id, :integer
  end
end
