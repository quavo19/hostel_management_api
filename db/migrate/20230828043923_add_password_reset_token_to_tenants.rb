class AddPasswordResetTokenToTenants < ActiveRecord::Migration[7.0]
  def change
    add_column :tenants, :password_reset_token, :string
  end
end
