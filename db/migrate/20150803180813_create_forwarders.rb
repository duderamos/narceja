class CreateForwarders < ActiveRecord::Migration
  def change
    create_table :forwarders do |t|
      t.string :name
      t.string :responsible
      t.text :goto
      t.references :domain, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :forwarders, :name, unique: true
  end
end
