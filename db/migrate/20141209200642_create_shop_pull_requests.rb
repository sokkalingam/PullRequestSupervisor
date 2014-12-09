class CreateShopPullRequests < ActiveRecord::Migration
  def change
    create_table :shop_pull_requests do |t|
      t.string :url
      t.datetime :opened_at
      t.string :html_url
      t.string :name
      t.string :display_name

      t.timestamps
    end
  end
end
