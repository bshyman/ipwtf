class CreateSettings < ActiveRecord::Migration[5.1]
  def up
    create_table :settings do |t|
      t.integer :refresh_interval
      t.string :theme
      t.boolean :unsubscribed, default: false
      t.references :user
      t.timestamps
    end
  end

  def handle_currents
    user_ids = Setting.pluck(:user_id)
    User.where.not(id: user_ids).each {|user| Setting.create(user_id: user.id)}
  end

  def down
    drop_table :settings
  end
end
