module ProposalsHelper
  # This helper creates a list of socks for the proposed match dropdown.
  def socks_options
    # Exclude socks that already have a match and optionally exclude @sock (when nested)
    matched_ids = Match.pluck(:sock_1_id, :sock_2_id).flatten.compact

    source = if defined?(@socks) && @socks.present?
      @socks.to_a
    else
      Sock.all.to_a
    end

    source = source.reject { |s| matched_ids.include?(s.id) }
    source = source.reject { |s| s.id == @sock.id } if defined?(@sock) && @sock.present?

    source.map { |sock| [sock.name, sock.id] }
  end
end
