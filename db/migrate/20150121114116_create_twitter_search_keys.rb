class CreateTwitterSearchKeys < ActiveRecord::Migration
  def change
    create_table :twitter_search_keys do |t|
      t.string :key

      t.timestamps
    end
  end
end
