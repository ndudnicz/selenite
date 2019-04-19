struct Selenite
  # :nodoc:
  macro _round(_X)
    {{ _X }} = {{ _X }} % 1.0 > 0.5 ? {{ _X }}.ceil : {{ _X }}.floor
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

    _round(p)
    _round(q)
    _round(t)
    _round(v)
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
    return self.hsv_to_rgb( _hsv[0], _hsv[1], _hsv[2] )
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
    rr = _r / 255
    gg = _g / 255
    bb = _b / 255
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
    return {h, s * 100.0, cmax * 100.0}
  end

  # Returns a hsv tuple Tuple(Float64, Float64, Float64)
  #
  # ```
  # Selenite.rgb_to_hsv({10.0, 22.0, 33.0}) # => {208.69565217391306, 69.6969696969697, 12.941176470588237}
  # ```
  def self.rgb_to_hsv(
    _rgb : Tuple(Float64, Float64, Float64)
  ) : Tuple(Float64, Float64, Float64)
    return self.rgb_to_hsv( _rgb[0], _rgb[1], _rgb[2] )
  end

end
