class CreatePublishers < ActiveRecord::Migration[6.1]
  def change
    create_table :publishers do |t|
      t.string :uri
      t.timestamps
    end
    add_index :publishers, :uri
  end
end
