# Generates response with 9 tweets from 3 different users
# first and second tweets does not mention locaweb
# third tweet is a reply to locaweb

class TweetsSupport
  def self.tweets
    [].tap do |tweets|
      (1..9).each do |i|
        tweet = TweetSupport.tweet

        tweet['entities']['user_mentions'] = ['screen_name' => 'locaweb'] unless [1, 2].include? i
        tweet['in_reply_to_user_id'] = 42 if i == 3

        variants.each do |attr|
          tweet[attr] = variant_value(attr, i)
        end

        tweets << tweet
      end
    end
  end

  def self.variants
    %w(id retweet_count favorite_count user)
  end

  def self.variant_value(attr, index)
    case attr
    when 'id' then index
    when 'user' then UsersSupport.users[index%3]
    else index * 10 end
  end
end
