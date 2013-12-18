class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.string :username, null: false
      t.string :uid, null: false
      t.string :authentication_token
      t.timestamps
    end
  end
end
