# Some color convert methods

struct Selenite
  # :nodoc:
  def initialize
  end

  # Returns a rgb tuple Tuple(Float64, Float64, Float64)
  #
  # ```
  # Selenite.hsv_to_rgb(42.0, 42.0, 42.0) # => {107.0, 94.0, 62.0}
  # ```
  def self.hsv_to_rgb(
    _h : Float64,
    _s : Float64,
    _v : Float64
  ) : Tuple(Float64, Float64, Float64)
    h = _h / 60.0
    s = _s / 100.0
    v = _v / 100.0
    hh = h.floor % 6.0

    f = h - h.floor
    p = 255.0 * v * (1.0 - s);
    q = 255.0 * v * (1.0 - (s * f));
    t = 255.0 * v * (1.0 - (s * (1.0 - f)));
    v *= 255.0;

    case hh
    when 1.0
      {q, v, p}
    when 2.0
      {p, v, t}
    when 3.0
      {p, q, v}
    when 4.0
      {t, p, v}
    when 5.0
      {v, p, q}
    else
      {v, t, p}
    end
  end

  # Returns a rgb tuple Tuple(Float64, Float64, Float64)
  #
  # ```
  # Selenite.hsv_to_rgb({42.0, 42.0, 42.0}) # => {107.0, 94.0, 62.0}
  # ```
  def self.hsv_to_rgb(
    _hsv : Tuple(Float64, Float64, Float64)
  ) : Tuple(Float64, Float64, Float64)
    self.hsv_to_rgb( _hsv[0], _hsv[1], _hsv[2] )
  end

  # Returns a hsv tuple Tuple(Float64, Float64, Float64)
  #
  # ```
  # Selenite.rgb_to_hsv(10.0, 22.0, 33.0) # => {208.69565217391306, 69.6969696969697, 12.941176470588237}
  # ```
  def self.rgb_to_hsv(
    _r : Float64,
    _g : Float64,
    _b : Float64
  ) : Tuple(Float64, Float64, Float64)
    rr = _r / 255.0
    gg = _g / 255.0
    bb = _b / 255.0
    sorted = [rr, gg, bb].sort
    cmax = sorted[-1]
    cmin = sorted[0]
    v = cmax - cmin
    if v == 0.0
      h = 0.0
    elsif cmax == rr
      h = (((gg - bb) / v) % 6.0) * 60.0
    elsif cmax == gg
      h = (((bb - rr) / v) + 2.0) * 60.0
    else
      h = (((rr - gg) / v) + 4.0) * 60.0
    end
    s = cmax == 0.0 ? 0.0 : v / cmax
    {h, s * 100.0, cmax * 100.0}
  end

  # Returns a hsv tuple Tuple(Float64, Float64, Float64)
  #
  # ```
  # Selenite.rgb_to_hsv({10.0, 22.0, 33.0}) # => {208.69565217391306, 69.6969696969697, 12.941176470588237}
  # ```
  def self.rgb_to_hsv(
    _rgb : Tuple(Float64, Float64, Float64)
  ) : Tuple(Float64, Float64, Float64)
    self.rgb_to_hsv( _rgb[0], _rgb[1], _rgb[2] )
  end

  # Returns a hsl tuple Tuple(Float64, Float64, Float64)
  #
  # ```
  # Selenite.rgb_to_hsl(128.0, 0.0, 128.0) # => {300.0, 100.0, 25.0}
  # ```
  def self.rgb_to_hsl(
    _r : Float64,
    _g : Float64,
    _b : Float64
  ) : Tuple(Float64, Float64, Float64)
    rr = _r / 255.0
    gg = _g / 255.0
    bb = _b / 255.0
    sorted = [rr, gg, bb].sort
    cmax = sorted[-1]
    cmin = sorted[0]
    v = cmax - cmin
    l = (cmax + cmin) / 2.0
    if v == 0.0
      {0.0, 0.0, l * 100.0}
    else
      s = v / (1.0 - (2.0 * l - 1.0).abs)
      if cmax == rr
        h = (((gg - bb) / v) % 6.0) * 60.0
      elsif cmax == gg
        h = (((bb - rr) / v) + 2.0) * 60.0
      else
        h = (((rr - gg) / v) + 4.0) * 60.0
      end
      {h, s * 100.0, l * 100.0}
    end
  end

  # Returns a hsl tuple Tuple(Float64, Float64, Float64)
  #
  # ```
  # Selenite.rgb_to_hsl({128.0, 0.0, 128.0}) # => {300.0, 100.0, 25.0}
  # ```
  def self.rgb_to_hsl(
    _rgb : Tuple(Float64, Float64, Float64)
  ) : Tuple(Float64, Float64, Float64)
    self.rgb_to_hsl( _rgb[0], _rgb[1], _rgb[2] )
  end

  # Returns a rgb tuple Tuple(Float64, Float64, Float64)
  #
  # ```
  # Selenite.hsl_to_rgb(300.0, 100.0, 50.0) # => {255.0, 0.0, 255.0}
  # ```
  def self.hsl_to_rgb(
    _h : Float64,
    _s : Float64,
    _l : Float64
  ) : Tuple(Float64, Float64, Float64)
    _h /= 60.0
    _s /= 100.0
    _l /= 100.0
    c = (1.0 - (2.0 * _l - 1.0).abs) * _s
    x = c * (1.0 - ((_h % 2.0) - 1.0).abs)
    m = _l - (c / 2.0)
    c = (c + m) * 255.0
    x = (x + m) * 255.0
    hh = _h.floor % 6.0
    case hh
    when 1.0
      {x, c, m * 255.0}
    when 2.0
      {m * 255.0, c, x}
    when 3.0
      {m * 255.0, x, c}
    when 4.0
      {x, m * 255.0, c}
    when 5.0
      {c, m * 255.0, x}
    else
      {c, x, m * 255.0}
    end
  end

  # Returns a rgb tuple Tuple(Float64, Float64, Float64)
  #
  # ```
  # Selenite.hsl_to_rgb({300.0, 100.0, 50.0}) # => {255.0, 0.0, 255.0}
  # ```
  def self.hsl_to_rgb(
    _hsv : Tuple(Float64, Float64, Float64)
  ) : Tuple(Float64, Float64, Float64)
    self.hsl_to_rgb( _hsv[0], _hsv[1], _hsv[2] )
  end


end
