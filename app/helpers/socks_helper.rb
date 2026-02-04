module SocksHelper
  def is_matched_class(sock)
    if sock.matched_socks.any?
      "sock matched"
    else
      "sock"
    end
  end
end
