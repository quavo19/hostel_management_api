class CreateDues < ActiveRecord::Migration[7.0]
  def change
    create_table :dues do |t|
      t.bigint :student_id, null: false
      t.decimal :amount_paid
      t.integer :year
      t.timestamps
    end
  end
end
