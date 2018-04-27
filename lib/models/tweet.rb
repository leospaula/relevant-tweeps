require 'json'

class Tweet
  @@attrs = %I(id created_at text link retweet_count favorite_count favorited retweeted lang in_reply_to_user_id user user_mentions)

  attr_reader *@@attrs

  def initialize(tweet)
    @@attrs.each do |attr|
      instance_variable_set("@#{attr.to_s}", resolve_attr_value(tweet, attr))
    end
  end

  def to_json
    {}.tap do |tweet|
      @@attrs.each do |attr|
        tweet[attr.to_s] = resolve_json_value(attr)
      end
    end
  end

  private

  def resolve_json_value(attr)
    return user.to_json if attr == :user
    instance_variable_get("@#{attr.to_s}")
  end

  def resolve_attr_value(tweet, attr)
    return tweet_mentions(tweet) if attr == :user_mentions
    return tweet_url(tweet) if attr == :link
    return User.new(tweet['user']) if attr == :user
    tweet[attr.to_s]
  end

  def tweet_url(tweet)
    "https://twitter.com/#{tweet['user']['screen_name']}/status/#{tweet['id']}"
  end

  def tweet_mentions(tweet)
    tweet['entities']['user_mentions'].map { |mention| mention['screen_name'] }
  end
end
