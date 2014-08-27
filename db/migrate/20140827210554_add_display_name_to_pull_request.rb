class AddDisplayNameToPullRequest < ActiveRecord::Migration
  def change
    add_column :pull_requests, :display_name, :string
  end
end
