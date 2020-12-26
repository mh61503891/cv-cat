class CreatePaperKeywords < ActiveRecord::Migration[6.1]
  def change
    create_table :paper_keywords do |t|
      t.references :paper, null: false, foreign_key: true
      t.references :keyword, null: false, foreign_key: true
      t.integer :order, null: false
      t.timestamps
    end
    add_index :paper_keywords, [:paper_id, :keyword_id, :order], unique: true
  end
end
