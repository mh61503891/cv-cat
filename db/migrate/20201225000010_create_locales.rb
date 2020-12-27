class CreateLocales < ActiveRecord::Migration[6.1]
  def change
    create_table :locales do |t|
      t.string :value, null: false
      t.timestamps
    end
    add_index :locales, :value, unique: true
  end
end
