class CreateMailboxes < ActiveRecord::Migration
  def change
    create_table :mailboxes do |t|
      t.string :username, limit: 32
      t.string :password
      t.string :name, limit: 32
      t.boolean :active
      t.datetime :lastlogin
      t.date :expires
      t.references :domain, index: true, foreign_key: true
      t.references :format, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :mailboxes, :username, unique: true
  end
end
