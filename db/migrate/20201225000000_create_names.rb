class CreateNames < ActiveRecord::Migration[6.1]
  def change
    create_table :names do |t|
      t.string :value, null: false
      t.string :locale, null: false
      t.references :namable, polymorphic: true
      t.timestamps
    end
    add_index :names, :value
    add_index :names, :locale
  end
end
