struct Selenite

  macro _round(_X)
    {{ _X }} = {{ _X }} % 1.0 > 0.5 ? {{ _X }}.ceil : {{ _X }}.floor
  end

  # https://en.wikipedia.org/wiki/HSL_and_HSV
  # Params:
  # _h : Hue in degree [0.0, 360.0]
  # _s : Saturation [0.0, 100.0]
  # _v : Value [0.0, 100.0]
  # Returns a tuple Tuple(Float64, Float64, Float64)
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

  def self.hsv_to_rgb(
    hsv : Tuple(Float64, Float64, Float64)
  ) : Tuple(Float64, Float64, Float64)
    return self.hsv_to_rgb( hsv[0], hsv[1], hsv[2] )
  end

  def rgb_to_hsv()
  end
end
