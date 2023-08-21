class AddRevivedAtToKeys < ActiveRecord::Migration[6.0]
  def change
    add_column :keys, :revived_at, :datetime
  end
end
