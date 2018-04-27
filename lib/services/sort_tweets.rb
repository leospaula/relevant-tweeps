class SortTweets
  def initialize(tweets)
    @tweets = tweets
  end

  def self.execute(tweets)
    new(tweets).execute
  end

  def execute
    @tweets.sort_by do |tweet| 
      [-tweet.user.followers_count, -tweet.retweet_count, -tweet.favorite_count]
    end
  end
end
