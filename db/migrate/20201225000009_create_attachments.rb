class CreateAttachments < ActiveRecord::Migration[6.1]
  def change
    create_table :attachments do |t|
      t.references :attachable, polymorphic: true
      t.string :content_type, null: false
      t.bigint :byte_size, null: false
      t.binary :blob, null: false
      t.timestamps
    end
    add_index :attachments, :content_type
    add_index :attachments, :byte_size
  end
end
