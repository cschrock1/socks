module SocksHelper
  def is_matched_class sock
    if sock.matched?
      "matched"
    end
  end
end
