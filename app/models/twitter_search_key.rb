class TwitterSearchKey < ActiveRecord::Base
  has_many :twitter_search_results
end
