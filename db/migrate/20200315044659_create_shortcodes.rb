class CreateShortcodes < ActiveRecord::Migration[6.0]
  def change
    create_table :shortcodes do |t|
      t.string :code
      t.string :url
      t.string :name
      t.integer :occurrences

      t.timestamps
    end
  end
end
