class RenameRawRateToRateValueInUsers < ActiveRecord::Migration
  def change
    rename_column :users, :raw_rate, :rate_value
  end
end
