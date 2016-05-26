class ChangeCodeDefaultValueToUsers < ActiveRecord::Migration
  def change
  	change_column :users, :code, :string, :null => true
  end
end
