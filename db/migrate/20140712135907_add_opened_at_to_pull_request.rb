class AddOpenedAtToPullRequest < ActiveRecord::Migration
  def change
    add_column :pull_requests, :opened_at, :timestamp
  end
end
