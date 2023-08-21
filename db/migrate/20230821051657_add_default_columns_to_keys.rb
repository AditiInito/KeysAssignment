class AddDefaultColumnsToKeys < ActiveRecord::Migration[6.0]
  def up
    change_column_default :keys, :used, from: nil, to: false

    change_column :keys, :called_at, :datetime, default: -> { 'CURRENT_TIMESTAMP' }
    change_column :keys, :revived_at, :datetime, default: -> { 'CURRENT_TIMESTAMP' }
  end

  def down
    change_column_default :keys, :used, from: false, to: nil

    change_column :keys, :called_at, :datetime, default: nil
    change_column :keys, :revived_at, :datetime, default: nil
  end
end
