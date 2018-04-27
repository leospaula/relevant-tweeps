class MostRelevantsAction < BaseActionHandler
  def self.mount_response(tweets)
    Response.new("200", tweets.map(&:to_json))
  end
end
