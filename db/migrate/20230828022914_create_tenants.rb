class CreateTenants < ActiveRecord::Migration[7.0]
  def change
    create_table :tenants do |t|
      t.string :name
      t.string :student_id
      t.string :phone_number
      t.date :date
      t.string :maters_number
      t.string :program
      t.integer :level
      t.boolean :admin, default: false
      t.string :password_digest
      t.string :email
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
