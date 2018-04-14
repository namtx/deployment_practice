require 'socket'

class Connection
  attr_accessor :path

  def initialize path:
    @path = path
    File.unlink(path) if File.exists?(path)
  end

  def server
    @server ||= UNIXServer.new(@path)
  end

  def on_request
    socket = server.socket
    yield(socket)
    socket.close
  end
end

class AppServer
  attr_reader :connection, :view

  def initialize connection:, view:
    @connection = connection
    @view = view
  end

  def run
    while true
      connection.on_request do |socket|
        while (line = socket.readline) != "\r\n"
          puts line
        end
        socket.write view.render
      end
    end
  end
end

class TimeView
  def render
%[HTTP/1.1 200 OK
The current timestamp is: #{ Time.now.to_i }
]
  end
end

AppServer.new connection: Connection.new(path: "/tmp/socktest.sock"), view: TimeView.new
