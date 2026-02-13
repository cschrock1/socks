module ProposalsHelper
  # This helper creates a list of socks for the proposed match dropdown.
  def socks_options
    @socks.map do |sock|
      [ sock.name, sock.id ]
    end
  end
end
