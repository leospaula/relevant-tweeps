class MostMentionsAction < BaseActionHandler
  def self.mount_response(tweets)
    grouped = tweets.group_by { |tweet| tweet.user.screen_name }
    sorted = grouped.sort_by { |k,v| -v.count }.to_h
    parsed = sorted.map { |k,v| { "#{k}": v.map(&:to_json) } }

    Response.new("200", parsed)
  end
end
