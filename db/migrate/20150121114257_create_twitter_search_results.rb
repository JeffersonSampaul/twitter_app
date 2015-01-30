class CreateTwitterSearchResults < ActiveRecord::Migration
  def change
    create_table :twitter_search_results do |t|
      t.references :twitter_search_key, index: true
      t.string :name
      t.string :profile_image_url
      t.integer :retweet_count

      t.timestamps
    end
  end
end
