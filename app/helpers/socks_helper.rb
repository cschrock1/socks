module SocksHelper
  def is_matched_class(sock)
    if sock.matched?
      "matched"
    end
  end

  # Return a small pastel palette entry (bg and accent) for a given match.
  # Colors are chosen to be soft so text remains readable on cards.
  def match_palette_entry_for(sock)
    return nil unless sock.matched?
    match = sock.match
    return nil unless match

    palette = [
      { bg: "#fff7f8", accent: "#ff6b6b" },
      { bg: "#f0fdff", accent: "#26a6c4" },
      { bg: "#f7fff6", accent: "#34d399" },
      { bg: "#fff8f1", accent: "#fb923c" },
      { bg: "#f6f9ff", accent: "#60a5fa" },
      { bg: "#fbf7ff", accent: "#a78bfa" },
      { bg: "#fffaf0", accent: "#facc15" },
      { bg: "#f0fdf4", accent: "#10b981" },
      { bg: "#f0f9ff", accent: "#0284c7" },
      { bg: "#fff0f6", accent: "#fb7185" }
    ]

    palette[ match.id % palette.length ]
  end

  # Return a deterministic index into the palette for CSS class mapping
  def match_color_index(sock)
    return nil unless sock.matched?
    match = sock.match
    return nil unless match
    match.id % 10
  end

  # CSS class name for matched sock color (e.g. "match-color-2")
  def match_color_class(sock)
    idx = match_color_index(sock)
    idx ? "match-color-#{idx}" : nil
  end

  # Inline style kept for backward compatibility (no-op now)
  def match_card_style(sock)
    nil
  end

  # Accent color (hex) for badges or accents for a matched sock
  def match_accent_color(sock)
    entry = match_palette_entry_for(sock)
    entry && entry[:accent]
  end
end
