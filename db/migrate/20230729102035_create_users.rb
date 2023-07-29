#db/migrate/20230729102035_create_users.rb
class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_hash
      t.timestamps null: false
    end
  end
end
