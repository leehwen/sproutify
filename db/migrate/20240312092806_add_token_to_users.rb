class AddTokenToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :token, :string

    User.update_all(token: SecureRandom.alphanumeric(32))
  end
end
