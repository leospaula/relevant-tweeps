class UsersSupport
  def self.users
    [].tap do |users|
      (1..3).each do |i|
        user = UserSupport.user
        variants.each do |attr|
          user[attr] = variant_value(attr, i)
        end
        users << user
      end
    end
  end

  def self.variants
    %w(id name screen_name followers_count friends_count favourites_count profile_link)
  end

  def self.variant_value(attr, index)
    case attr
    when 'id' then index
    when 'name' then "User Name #{index}"
    when 'screen_name' then "user_#{index}"
    when 'profile_link' then "https://twitter.com/user_#{index}"
    else index * 10 end
  end
end
