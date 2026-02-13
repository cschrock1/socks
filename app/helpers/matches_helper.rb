module MatchesHelper
  def socks_options
    # Exclude socks that already have a match and exclude the current @sock
    matched_ids = Match.pluck(:sock_1_id, :sock_2_id).flatten.compact

    source = if defined?(@socks) && @socks.present?
      @socks
    else
      Sock.all
    end

    source = source.reject { |s| matched_ids.include?(s.id) }
    source = source.reject { |s| s.id == @sock.id } if defined?(@sock) && @sock.present?

    source.map { |sock| [sock.name, sock.id] }
  end
end
