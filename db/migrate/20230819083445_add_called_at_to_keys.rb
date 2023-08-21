class AddCalledAtToKeys < ActiveRecord::Migration[6.0]
  def change
    add_column :keys, :called_at, :datetime
  end
end
