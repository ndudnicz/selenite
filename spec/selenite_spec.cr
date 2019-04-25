require "../src/selenite"
require "csv_processor"
require "spec"

def _round(x : Float64)
  return x % 1 > 0.5 ? x.ceil : x.floor
end

describe Selenite do
  # TODO: Write tests

  it "hsv_to_rgb 10000 tests" do
    csv = CSVProcessor::CSVP.new("./spec/files/hsv_to_rgb.csv")
    csv.read_file
    csv.records.each do |row|
      ret = Selenite.hsv_to_rgb(Float64.new(row["h"]), Float64.new(row["s"]), Float64.new(row["v"]))
      ret.should eq({Float64.new(row["r"]), Float64.new(row["g"]), Float64.new(row["b"])})
    end
  end

  it "rgb_to_hsv 10000 tests" do
    csv = CSVProcessor::CSVP.new("./spec/files/rgb_to_hsv.csv")
    csv.read_file
    csv.records.each do |row|
      ret = Selenite.rgb_to_hsv(Float64.new(row["r"]), Float64.new(row["g"]), Float64.new(row["b"]))
      # TODO: round problem handling, feel free to provide better rgb_to_hsv.csv dataset
      v0 = ret[0] - Float64.new(row["h"])
      v1 = ret[1] - Float64.new(row["s"])
      v2 = ret[2] - Float64.new(row["v"])
      (v0.abs < 1).should eq true
      (v1.abs < 1).should eq true
      (v2.abs < 1).should eq true
    end
  end

  it "rgb_to_hsl 16 tests" do
    csv = CSVProcessor::CSVP.new("./spec/files/rgb_to_hsl.csv")
    csv.read_file
    csv.records.each do |row|
      ret = Selenite.rgb_to_hsl(Float64.new(row["r"]), Float64.new(row["g"]), Float64.new(row["b"]))
      # TODO: round problem handling, feel free to provide better rgb_to_hsl.csv dataset
      v0 = ret[0] - Float64.new(row["h"])
      v1 = ret[1] - Float64.new(row["s"])
      v2 = ret[2] - Float64.new(row["l"])
      (v0.abs < 1).should eq true
      (v1.abs < 1).should eq true
      (v2.abs < 1).should eq true
    end
  end


end
