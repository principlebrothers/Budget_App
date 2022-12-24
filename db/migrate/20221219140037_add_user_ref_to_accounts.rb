class AddUserRefToAccounts < ActiveRecord::Migration[7.0]
  def change
    add_reference :accounts, :user, null: false, foreign_key: true
  end
end
