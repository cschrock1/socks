def socks_options
  @socks.map do |sock|
    [sock.name, sock.id]
  end
end