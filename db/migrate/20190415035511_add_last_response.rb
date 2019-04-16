class AddLastResponse < ActiveRecord::Migration[5.1]
  def change
    add_column :interfaces, :last_response, :string
  end
end
