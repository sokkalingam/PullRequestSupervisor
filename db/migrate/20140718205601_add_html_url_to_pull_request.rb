class AddHtmlUrlToPullRequest < ActiveRecord::Migration
  def change
    add_column :pull_requests, :html_url, :string
  end
end
