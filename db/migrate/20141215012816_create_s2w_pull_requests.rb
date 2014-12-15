class CreateS2wPullRequests < ActiveRecord::Migration
  def change
    create_table :s2w_pull_requests do |t|
      t.string :url
      t.string :name
      t.string :display_name
      t.string :html_url
      t.datetime :opened_at

      t.timestamps
    end
  end
end
