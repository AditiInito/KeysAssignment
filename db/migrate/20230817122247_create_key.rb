class CreateKey < ActiveRecord::Migration[6.0]
  def change
    create_table :keys do |t|
      t.integer :key
      t.boolean :used

      t.timestamps
    end
  end
end
