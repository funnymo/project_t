class AddCodeToPremiumTransaction < ActiveRecord::Migration
  def change
    add_column :premium_transactions, :premium, :string
  end
end
