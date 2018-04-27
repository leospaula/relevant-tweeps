class RequestParser
  def initialize(request)
    @request = request
  end

  def parse
    @method, @path = request.lines.first.split
  end

  attr_reader :request, :method, :path
end
