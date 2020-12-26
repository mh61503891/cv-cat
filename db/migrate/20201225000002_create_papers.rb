class CreatePapers < ActiveRecord::Migration[6.1]
  def change
    create_table :papers do |t|
      t.references :publication, null: false, foreign_key: true
      t.string :pages
      t.string :page_from
      t.string :page_to
      t.string :volume
      t.string :number
      t.string :doi
      t.integer :year
      t.integer :month
      t.integer :day
      t.date :received_on
      t.date :accepted_on
      t.date :published_on
      t.date :released_on
      t.date :revised_on
      t.integer :open_access, null: false, default: 0
      t.timestamps
    end
    add_index :papers, :pages
    add_index :papers, :page_from
    add_index :papers, :page_to
    add_index :papers, :volume
    add_index :papers, :number
    add_index :papers, :doi
    add_index :papers, :year
    add_index :papers, :month
    add_index :papers, :day
    add_index :papers, :received_on
    add_index :papers, :accepted_on
    add_index :papers, :published_on
    add_index :papers, :released_on
    add_index :papers, :revised_on
    add_index :papers, :open_access
  end
end
