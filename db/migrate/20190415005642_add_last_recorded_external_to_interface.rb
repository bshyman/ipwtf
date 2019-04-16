class AddLastRecordedExternalToInterface < ActiveRecord::Migration[5.1]
  def change
    add_column :interfaces, :last_external_ip, :string
  end
end
