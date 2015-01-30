class TwittersController < ApplicationController
  require 'open-uri'
  require 'rest-client'
  require 'json'

  def search
  end
 
  def search_key
    key = params[:q]
    @search_key = TwitterSearchKey.create(key: key)
    Twitter::Search.invoke_http_request(@search_key)
  end   
end
