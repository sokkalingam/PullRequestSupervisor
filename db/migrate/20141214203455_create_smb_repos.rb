class CreateSmbRepos < ActiveRecord::Migration
  def change
    create_table :smb_repos do |t|
      t.string :url

      t.timestamps
    end
  end
end
