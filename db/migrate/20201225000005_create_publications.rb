class CreatePublications < ActiveRecord::Migration[6.1]
  def change
    create_table :publications do |t|
      t.string :issn_online
      t.string :issn_print
      t.string :issn_linking
      t.string :issn_electronic
      t.references :publisher, null: false, foreign_key: true
      t.timestamps
    end
    add_index :publications, :issn_online
    add_index :publications, :issn_print
    add_index :publications, :issn_linking
    add_index :publications, :issn_electronic
  end
end
