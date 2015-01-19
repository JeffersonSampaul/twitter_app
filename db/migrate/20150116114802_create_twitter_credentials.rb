class CreateTwitterCredentials < ActiveRecord::Migration
  def change
    create_table :twitter_credentials do |t|
      t.string :profile_image_url
      t.integer :retweet_count

      t.timestamps
    end
  end
end
