class AddTitleAndDescriptionIntoShares < ActiveRecord::Migration[5.2]
  def change
    add_column :shares, :title, :string
    add_column :shares, :description, :string
  end
end
