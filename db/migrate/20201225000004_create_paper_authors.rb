class CreatePaperAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :paper_authors do |t|
      t.references :paper, null: false, foreign_key: true
      t.references :author, null: false, foreign_key: true
      t.integer :order, null: false
      t.timestamps
    end
    add_index :paper_authors, [:paper_id, :author_id, :order], unique: true
  end
end
