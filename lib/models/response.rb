class Response
  def initialize(code, data)
    @code = code
    @data = data
    @status = set_status
  end

  attr_reader :code, :data, :status

  private

  def set_status
    return "#{code} OK" if code == '200'
    "#{code} #{data}"
  end
end
