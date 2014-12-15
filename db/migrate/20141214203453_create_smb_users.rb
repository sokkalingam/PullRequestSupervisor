class CreateSmbUsers < ActiveRecord::Migration
  def change
    create_table :smb_users do |t|
      t.string :name
      t.string :display_name
      t.datetime :last_commented
      t.datetime :last_merged

      t.timestamps
    end
  end
end
