class AddNameToPullRequest < ActiveRecord::Migration
  def change
    add_column :pull_requests, :name, :string
  end
end
