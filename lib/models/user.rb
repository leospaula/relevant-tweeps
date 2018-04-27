require 'json'

class User
  @@attrs = %I(id name screen_name location description followers_count friends_count listed_count favourites_count verified profile_link)

  attr_reader *@@attrs

  def initialize(user)
    @@attrs.each do |attr|
      instance_variable_set("@#{attr.to_s}", resolve_attr_value(user, attr))
    end
  end

  def to_json
    {}.tap do |user|
      @@attrs.each do |attr|
        user[attr.to_s] = instance_variable_get("@#{attr.to_s}")
      end
    end
  end

  private

  def resolve_attr_value(user, attr)
    return profile_url(user) if attr == :profile_link
    user[attr.to_s]
  end

  def profile_url(user)
    "https://twitter.com/#{user['screen_name']}"
  end
end
