require 'socket'

class Server
  def self.run
    server = TCPServer.new('localhost', 3000)

    loop do
      Thread.start(server.accept) do |client|
        request = RequestParser.new(client.readpartial(1024))
        request.parse

        response = Router.execute(request.method, request.path)

        client.write "HTTP/1.0 #{response.status}\r\n"
        client.write "Content-Length: #{response.data.to_s.length}\r\n"
        client.write "\r\n"

        client.write response.data

        client.close
      end
    end
  end
end
