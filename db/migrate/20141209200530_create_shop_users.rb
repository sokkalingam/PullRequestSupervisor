class CreateShopUsers < ActiveRecord::Migration
  def change
    create_table :shop_users do |t|
      t.string :name
      t.datetime :last_commented
      t.datetime :last_merged
      t.string :display_name

      t.timestamps
    end
  end
end
