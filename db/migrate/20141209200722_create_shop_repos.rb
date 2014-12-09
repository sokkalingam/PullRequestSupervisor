class CreateShopRepos < ActiveRecord::Migration
  def change
    create_table :shop_repos do |t|
      t.string :url

      t.timestamps
    end
  end
end
