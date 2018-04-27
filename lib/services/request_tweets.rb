require 'net/http'
require 'uri'
require 'json'

class RequestTweets
  BASE_URI = 'http://tweeps.locaweb.com.br/tweeps'

  def initialize
    @uri = URI(BASE_URI)
    @request = Net::HTTP::Get.new(@uri)
  end

  def self.execute
    new.execute
  end

  def execute
    set_user

    Net::HTTP.start(@uri.hostname, @uri.port) do |http|
      parse_response(http.request(@request))
    end
  end

  private

  def set_user
    @request['Username'] = ENV.fetch('HTTP_USERNAME', '')
  end

  def parse_response(response)
    Response.new(response.code, parse_body(response))
  end

  def parse_body(response)
    return JSON.parse(response.body)['statuses'] if response.code == "200"
    response.body
  end
end
