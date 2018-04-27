class BaseActionHandler
  def self.execute
    requested_tweets = RequestTweets.execute
    
    return requested_tweets unless requested_tweets.code == '200'

    list = requested_tweets.data.map { |tweet| Tweet.new(tweet) }

    filtered = FilterTweets.execute(list)
    ordered = SortTweets.execute(filtered)

    mount_response(ordered)
  end
end
