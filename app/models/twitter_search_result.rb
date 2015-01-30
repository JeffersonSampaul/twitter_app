class TwitterSearchResult < ActiveRecord::Base
  belongs_to :twitter_search_key

  def self.save_results(key_record, results)
    results && results.each do |r|
      name = r["user"]["name"]
      image = r["user"]["profile_image_url"]
      count = r["retweet_count"]
      key_record.twitter_search_results.create(name: name, profile_image_url: image, retweet_count: count) 
    end
  end
end
