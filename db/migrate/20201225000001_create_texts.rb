class CreateTexts < ActiveRecord::Migration[6.1]
  def change
    create_table :texts do |t|
      t.string :value, null: false
      t.string :locale, null: false
      t.references :textable, polymorphic: true
      t.timestamps
    end
    add_index :texts, :value
    add_index :texts, :locale
  end
end
