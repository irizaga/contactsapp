class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :user_name
      t.integer :age
      t.text :bio

      t.timestamps
    end
  end
end
