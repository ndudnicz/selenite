require "../src/selenite"
require "csv_processor"
require "spec"

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
end
