class FilterTweets
  def initialize(tweets)
    @tweets = tweets
  end

  def self.execute(tweets)
    new(tweets).execute
  end

  def execute
    filter_user_mentions
    filter_replies
  end
  
  private

  def filter_user_mentions
    @tweets.select! do |tweet|
      tweet.user_mentions.include? 'locaweb'
    end
  end

  def filter_replies
    @tweets.select! do |tweet|
      tweet.in_reply_to_user_id != 42
    end
  end
end
