class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.string :type
      t.text :content
      t.integer :created_by
      t.references :interface
      t.boolean :encrypted, default: false
      t.timestamps
    end
  end
end
