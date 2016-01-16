class AddColumnsToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :user, :string
    add_column :reviews, :repo, :string
  end
end
