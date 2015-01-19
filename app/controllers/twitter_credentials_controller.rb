class TwitterCredentialsController < ApplicationController
  require 'open-uri'
  require 'rest-client'
  require 'json'
  require "addressable/uri"

  def tweets
    puts params[:q]
    p '777777777777777777777777777777777777777'

    params = params[:q] 
    # encoded_params = URI::encode(params) 
    # url = "https://api.twitter.com/1.1/search/tweets.json?q=%40twitterapi"
    encode_params = Addressable::URI.parse(params)
    url = "https://api.twitter.com/1.1/search/tweets.json?q=#{encode_params}"
    headers = { "Authorization" => "Bearer AAAAAAAAAAAAAAAAAAAAAEVDWQAAAAAAKve7Q9RM2YmkO5iZIPGp6rhezSo%3DKAsecfDJLabCvgr31LrjbN1XlGmfEhyaQp3bYi9sMeKtn50W3H", "Content-Type" => "application/x-www-form-urlencoded;charset=UTF-8", "Accept-Encoding" => "gzip"}
    begin
      puts url
      puts headers
      response = RestClient::Request.execute(method: :get, url: url, headers: headers)
      parsed_response = JSON.parse(response)
      # response = RestClient::Request.execute(method: :post, url: url, payload: encoded_params, headers: headers)
      puts parsed_response["statuses"]
      p 5555555555555555555
      puts parsed_response["statuses"].first["user"]["followers_count"]
      puts parsed_response["statuses"].first["user"]["profile_image_url"]
      puts parsed_response["statuses"].first["retweet_count"]
      # puts parsed_response["statuses"].first["user"]["name"]
      # puts parsed_response["statuses"].first["followers_count"]
    rescue => e
      p 777777777777777777777
      puts e
    end

  end   
end
