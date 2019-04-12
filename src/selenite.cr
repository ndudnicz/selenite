struct Selenite

  # https://en.wikipedia.org/wiki/HSL_and_HSV
  # Returns a tuple Tuple(Float64, Float64, Float64)
  #
  # ```
  # Selenite.hsv_to_rgb(42, 0.42, 0.42) # => {107.52, 93.97247999999999, 62.3616}
  # ```
  def self.hsv_to_rgb(
    h : Float64,
    s : Float64,
    v : Float64
  ) : Tuple(Float64, Float64, Float64)
    # get C (chroma)
    c = v * s

    # get H'
    hh = h / 60.0

    # get X
    x = c * (1.0 - ((hh % 2.0) - 1.0).abs)

    # get m
    m = v - c

    # get RGB
    if 0 <= hh && hh < 1.0
      t = {c + m, x + m, 0.0 + m}
    elsif 1.0 < hh && hh <= 2.0
      t = {x + m, c + m, 0.0 + m}
    elsif 2.0 < hh && hh <= 3.0
      t = {0.0 + m, c + m, x + m}
    elsif 3.0 < hh && hh <= 4.0
      t = {0.0 + m, x + m, c + m}
    elsif 4.0 < hh && hh <= 5.0
      t = {x + m, 0.0 + m, c + m}
    elsif 5.0 < hh && hh <= 6.0
      t = {c + m, 0.0 + m, x + m}
    else
      t = {0.0 + m, 0.0 + m, 0.0 + m}
    end
    t.map { |x| x * 256 }
  end

  def self.hsv_to_rgb(
    hsv : Tuple(Float64, Float64, Float64)
  ) : Tuple(Float64, Float64, Float64)
    return self.hsv_to_rgb( hsv[0], hsv[1], hsv[2] )
  end

  def rgb_to_hsv()
  end
end
