class CreateS2wRepos < ActiveRecord::Migration
  def change
    create_table :s2w_repos do |t|
      t.string :url

      t.timestamps
    end
  end
end
