class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.timestamp :last_commented
      t.timestamp :last_merged

      t.timestamps
    end
  end
end
