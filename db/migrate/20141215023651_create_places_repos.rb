class CreatePlacesRepos < ActiveRecord::Migration
  def change
    create_table :places_repos do |t|
      t.string :url

      t.timestamps
    end
  end
end
