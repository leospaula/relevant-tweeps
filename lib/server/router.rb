class Router
  def initialize(method, path)
    @method = method
    @path = path
  end

  def self.execute(method, path)
    new(method, path).execute
  end

  def execute
    if @method == 'GET'
      if @path == '/most_relevants'
        return MostRelevantsAction.execute
      elsif @path == '/most_mentions'
        return MostMentionsAction.execute
      end
    end

    response_404
  end

  private

  def response_404
    Response.new('404', 'Not Found')
  end
end
