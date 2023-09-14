class AddProfileImageToTenants < ActiveRecord::Migration[7.0]
  def change
    add_column :tenants, :profile_image, :string
  end
end
