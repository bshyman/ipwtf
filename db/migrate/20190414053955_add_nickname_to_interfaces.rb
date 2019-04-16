class AddNicknameToInterfaces < ActiveRecord::Migration[5.1]
  def change
    add_column :interfaces, :nickname, :string
  end
end
