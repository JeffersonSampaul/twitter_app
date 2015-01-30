module Twitter
  class Search
    require 'addressable/uri'

    def self.invoke_http_request(search_key_record)
      puts search_key_record
      key = search_key_record.key
      encode_params = Addressable::URI.parse(key)
      url = "https://api.twitter.com/1.1/search/tweets.json?q=#{encode_params}"
      headers = { "Authorization" => "Bearer AAAAAAAAAAAAAAAAAAAAAEVDWQAAAAAAKve7Q9RM2YmkO5iZIPGp6rhezSo%3DKAsecfDJLabCvgr31LrjbN1XlGmfEhyaQp3bYi9sMeKtn50W3H", "Content-Type" => "application/x-www-form-urlencoded;charset=UTF-8", "Accept-Encoding" => "gzip"}
      begin
        response = RestClient::Request.execute(method: :get, url: url, headers: headers)
        parsed_response = JSON.parse(response)
        results = parsed_response["statuses"]
        TwitterSearchResult.save_results(search_key_record, results)
      rescue => e
        p "))))))))))))))))))))))))000" 
        puts e
      end
    end
  end

end
