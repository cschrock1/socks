module MatchesHelper
  def socks_options
    # TODO: Use RDoc for function documentation like below
    # [["", 1],["", 2],["", 3]]
    @socks.map do |sock|
      [sock.name, sock.id]
    end
  end
end
