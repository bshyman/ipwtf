class CreateInterfaces < ActiveRecord::Migration[5.1]
  def change
    create_table :interfaces do |t|
      t.string :ip, limit: 15
      t.string :scope
      t.string :ddns
      t.integer :port, limit: 6
      t.datetime :last_responded_at
      t.references :user

      t.timestamps
    end
  end
end
